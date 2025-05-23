return {
  {
    "dracula/vim",
    lazy = false,
    name = "dracula",
    priority = 1001,
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  },
}
