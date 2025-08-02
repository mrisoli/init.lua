-- lsp/biome.lua
local M = {}

-- Capabilities: extend default with nvim-cmp if available
local caps = vim.lsp.protocol.make_client_capabilities()
do
  local ok, cmp = pcall(require, "cmp_nvim_lsp")
  if ok then
    caps = cmp.default_capabilities(caps)
  end
end
M.capabilities = caps

-- on_attach: format & fix imports on save via Biome LSP
M.on_attach = function(client, bufnr)
  -- Format with Biome on save
  local fmt_grp = vim.api.nvim_create_augroup("BiomeFormatOnSave", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group  = fmt_grp,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({
        filter = function(c) return c.name == "biome" end,
        bufnr  = bufnr,
      })
    end,
  })

  -- Apply source.fixAll.biome on save (organize imports, fix diagnostics)
  local fix_grp = vim.api.nvim_create_augroup("BiomeFixAllOnSave", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group  = fix_grp,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.code_action({
        context = { only = { "source.fixAll.biome" }, diagnostics = {} },
        apply   = true,
        bufnr   = bufnr,
      })
    end,
  })
end

-- Command to start the Biome language server
M.cmd = { "biome", "lsp", "--stdio" }

-- Filetypes handled by Biome
M.filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
}

-- Project root markers
M.root_markers = {
  "package.json",
  "tsconfig.json",
  "jsconfig.json",
  ".git",
}

return M
