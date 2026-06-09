return {
	-- "github/copilot.vim",
	"tpope/vim-fugitive",

	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	"nathangrigg/vim-beancount",
}
