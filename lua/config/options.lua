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
vim.opt.backupdir = os.getenv("HOME") .. "/.config/nvim/.backup"
vim.opt.directory = os.getenv("HOME") .. "/.config/nvim/.tmp"
vim.opt.termguicolors = true

local augroup = vim.api.nvim_create_augroup
local eofGroup = augroup("eof", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

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

autocmd({ "BufWritePre" }, {
  group = eofGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
