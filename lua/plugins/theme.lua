return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
}
