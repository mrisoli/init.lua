vim.opt.nu = true
vim.opt.rnu = true
vim.opt.background = "dark"
vim.opt.backspace = "indent,eol,start"
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup"
vim.opt.directory = vim.fn.stdpath("data") .. "/tmp"
vim.opt.termguicolors = true

local augroup = vim.api.nvim_create_augroup
local eofGroup = augroup("eof", { clear = true })

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", { clear = true })

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

autocmd("BufWritePre", {
  group = eofGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.diagnostic.config({ jump = { float = true } })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
