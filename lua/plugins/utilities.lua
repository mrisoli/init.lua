return {
  "github/copilot.vim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-fugitive",

  { "gennaro-tedesco/nvim-peekup", lazy = true },
  { "kyazdani42/nvim-tree.lua", lazy = true },
  { "simrat39/symbols-outline.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  "jremmen/vim-ripgrep",

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
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  "nathangrigg/vim-beancount",
}
