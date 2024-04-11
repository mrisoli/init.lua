require("lazy").setup({

  "github/copilot.vim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-fugitive",
  "ggandor/leap.nvim",

  "gennaro-tedesco/nvim-peekup",
  "kyazdani42/nvim-tree.lua",
  "simrat39/symbols-outline.nvim",
  "nvim-tree/nvim-web-devicons",

  "jremmen/vim-ripgrep",

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  { "dracula/vim", name = "dracula" },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  },

  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/vim-vsnip",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "sharkdp/fd" },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  "nathangrigg/vim-beancount",

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        auto_open = true,
        auto_close = true,
      })
    end,
  },
})
