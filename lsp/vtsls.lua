return {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	on_attach = function(client, bufnr)
		-- Enable built‑in omnifunc completion
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		---------------------------------------------------------------------------
		-- 🧩 Basic LSP Keymaps
		---------------------------------------------------------------------------
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

		---------------------------------------------------------------------------
		-- 🧩 Vtsls Fixers Command + Autoformat on Save
		---------------------------------------------------------------------------
		local function run_vtsls_fix_all()
			local kinds = {
				"source.organizeImports",
				"source.sortImports",
				"source.removeUnusedImports",
				"source.fixAll.ts",
				"source.removeUnused.ts",
				"source.addMissingImports.ts",
			}

			for _, kind in ipairs(kinds) do
				vim.lsp.buf.code_action({
					context = { only = { kind }, diagnostics = {} },
					apply = true,
				})
			end
		end

		-- Add user command for manual use
		vim.api.nvim_buf_create_user_command(bufnr, "VtslsFixAll", run_vtsls_fix_all, {
			desc = "Run all TypeScript/VTSLS fixers (organize, remove unused, add missing imports, etc.)",
		})

		-- Optional keymap
		vim.keymap.set("n", "<leader>tf", "<cmd>VtslsFixAll<CR>", { buffer = bufnr, desc = "TypeScript Fix All" })
	end,

	cmd = { "vtsls", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
}
