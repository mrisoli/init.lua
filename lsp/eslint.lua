-- lsp/eslint.lua (Neovim 0.11+ friendly, no lspconfig dependency)

local M = {}

-- Capabilities (works with or without nvim-cmp)
local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
M.capabilities = ok_cmp and cmp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

-- Root detection using native vim.fs
local function find_root(fname)
  local patterns = {
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.json",
    "eslint.config.js",
    "eslint.config.mjs",
    "package.json",
    ".git",
  }
  local found = vim.fs.find(patterns, { upward = true, path = fname })[1]
  return (found and vim.fs.dirname(found)) or vim.fn.getcwd()
end

M.on_attach = function(client, bufnr)
  -- Buffer-local command to run Fix All
  local function eslint_fix_all()
    vim.lsp.buf.code_action({
      context = { only = { "source.fixAll.eslint" }, diagnostics = {} },
      apply = true,
    })
  end
  vim.api.nvim_buf_create_user_command(bufnr, "EslintFixAll", function()
    vim.lsp.buf.code_action({
      context = { only = { "source.fixAll.eslint" }, diagnostics = {} },
      apply = true,
    })
  end, { desc = "Run ESLint Fix All on this buffer" })
  vim.keymap.set("n", "<leader>xf", "<cmd>EslintFixAll<CR>", { buffer = bufnr, desc = "ESLint Fix All" })

  -- Auto fix on save (before write)
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    desc = "ESLint: Fix All before save",
    callback = function()
      if client.name ~= "eslint" then
        return
      end
      -- Skip unnamed buffers
      if vim.api.nvim_buf_get_name(bufnr) == "" then
        return
      end
      vim.lsp.buf.code_action({
        context = { only = { "source.fixAll.eslint" } },
        apply = true,
      })
    end,
  })
end

-- Server definition for vim.lsp.enable
M.server = {
  -- If installed via Mason: eslint-lsp (vscode-langservers-extracted)
  cmd = { "vscode-eslint-language-server", "--stdio" },

  -- Filetypes to attach to
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
  },

  -- Modern root_dir without lspconfig
  root_dir = function(fname)
    return find_root(fname)
  end,

  -- ESLint server settings
  settings = {
    -- Resolve eslint/config relative to the file location (prevents -32603 crashes)
    workingDirectory = { mode = "location" },

    validate = "on",
    format = false, -- let another tool handle formatting (Biome/Prettier/VTSLS)
    codeActionOnSave = { enable = true, mode = "all" },

    -- Flip to true if your project uses eslint.config.js (flat config, ESLint v9+)
    experimental = { useFlatConfig = false },
  },
}

return M
