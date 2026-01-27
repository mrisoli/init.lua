return {
	{
		"dracula/vim",
		lazy = false,
		name = "dracula",
		priority = 1001,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1002 },
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
}
