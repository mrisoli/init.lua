return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local ft_javascript = { "prettierd", "prettier", stop_after_first = true }
		conform.setup({
			format_on_save = { lsp_fallback = true, timeout_ms = 500 },
			formatters_by_ft = {
				javascript = ft_javascript,
				typescript = ft_javascript,
				javascriptreact = ft_javascript,
				typescriptreact = ft_javascript,
				svelte = ft_javascript,
				css = ft_javascript,
				html = ft_javascript,
				json = ft_javascript,
				yaml = ft_javascript,
				markdown = ft_javascript,
				graphql = ft_javascript,
				lua = { "stylua" },
				python = { "isort", "black" },
			},
		})
	end,
}
