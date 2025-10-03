require("config")
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
    end
  end,
})
-- vim.g.loaded_python3_provider = 0
-- vim.g.loaded_ruby_provider = 0
-- vim.g.loaded_perl_provider = 0
vim.lsp.start({ name = "biome", cmd = { "biome", "lsp-proxy" } })
vim.lsp.start({ name = "eslint", cmd = { "eslint", "--stdio" } })
vim.diagnostic.config({
  underline = true,
  virtual_line = true,
  virtual_text = {
    prefix = "●",
    spacing = 2,
    severity_limit = "Warning",
  },
  loclist = {
    open = true,
    severity = { min = vim.diagnostic.severity.WARN },
  },
})
