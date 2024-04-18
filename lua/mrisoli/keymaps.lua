vim.keymap.set("n", "<Leader>s", ":%s/\\<<C-r><C-w>\\>/", { noremap = true })
vim.keymap.set("n", "=j", ":%!python -m json.tool<CR>", {})
vim.keymap.set("n", "<leader>g", ":Rg<cr>", { noremap = true })

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "H", "<cmd>bp<cr>", opts)
vim.keymap.set("n", "L", "<cmd>bn<cr>", opts)
