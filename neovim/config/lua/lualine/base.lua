local current_style = require('lualine.styles.evilline')
local current_theme = require('lualine.themes.base16')

require('lualine').setup(config)
require('lualine').setup {
  options = {
    theme = current_theme
  }
}

