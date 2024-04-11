vim.keymap.set("n", "<Leader>s", ":%s/\\<<C-r><C-w>\\>/", { noremap = true })
vim.keymap.set("n", "=j", ":%!python -m json.tool<CR>", {})
vim.keymap.set("n", "<leader>g", ":Rg<cr>", { noremap = true })

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<C-k>", "<cmd>cprev<cr>", opts)
vim.keymap.set("n", "<C-j>", "<cmd>cnext<cr>", opts)
vim.keymap.set("n", "H", "<cmd>bprev<cr>", opts)
vim.keymap.set("n", "L", "<cmd>bnext<cr>", opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
