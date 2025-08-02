return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    bigfile = {},
    dashboard = {},
    explorer = {},
    image = {
      doc = { inline = false },
    },
    input = {},
    notifier = {},
    picker = {},
    quickfile = {},
    scope = {},
    scroll = {},
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
