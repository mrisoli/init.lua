return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    require("snacks").setup(opts)
    vim.ui.select = Snacks.picker.select
    Snacks.image.meta.health = false
    Snacks.input.meta.health = false
    Snacks.lazygit.meta.health = false
    Snacks.scroll.meta.health = false
  end,
  opts = {
    bigfile = {},
    dashboard = {},
    explorer = {},
    image = { enabled = false },
    input = { enabled = false },
    lazygit = { enabled = false },
    notifier = {},
    picker = {},
    quickfile = {},
    scope = {},
    statuscolumn = {},
    words = {},
  },
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>w",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Grep word",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>n",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    {
      '<leader>S"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
  },
}
