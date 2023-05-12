-- [[ lualine.nvim ]]

return {
  {
    -- Status line
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      local current_theme = require('plugins.lualine-config.themes.base16')
      require('plugins.lualine-config.styles.simple').setup_style(current_theme)
    end,
  }
}
