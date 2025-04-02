return {
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "rose-pine/neovim",
    lazy = false,
    name = "rose-pine",
    priority = 1001,
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  },
}
