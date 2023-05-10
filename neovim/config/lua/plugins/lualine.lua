require('utils')

-- [[ lualine.nvim ]]
-- Status line

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      if isModuleAvailable('lualine') then
        local current_theme = require('plugins.lualine-config.themes.base16')
        require('plugins.lualine-config.styles.simple').setup_style(current_theme)
      end
    end,
}
