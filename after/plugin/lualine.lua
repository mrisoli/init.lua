local theme = require("lualine.themes.dracula")
local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
for _, mode in ipairs(modes) do
  theme[mode].c.bg = "NONE"
end

require("lualine").setup({
  options = {
    theme = theme,
  },
})
