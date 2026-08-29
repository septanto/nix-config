local get_palette = require('subdued.palette')

local subdued = {}

function subdued.setup()
  local palette = get_palette()
  require('mini.hues').apply_palette(palette)
  vim.g.colors_name = 'subdued'

  require('subdued.transparent').apply()
end

return subdued
