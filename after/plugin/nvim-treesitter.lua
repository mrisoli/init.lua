require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "regex",
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "lua",
    "yaml",
    "svelte",
    "swift",
    "html",
    "scss",
  },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsename = { "javascript", "typescript.tsx" }
