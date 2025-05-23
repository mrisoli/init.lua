return {
  "github/copilot.vim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-fugitive",

  { "gennaro-tedesco/nvim-peekup", lazy = true },
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
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  "nathangrigg/vim-beancount",
}
