return {
	{
		"dracula/vim",
		name = "dracula",
		lazy = false,
		priority = 1000,
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
}
