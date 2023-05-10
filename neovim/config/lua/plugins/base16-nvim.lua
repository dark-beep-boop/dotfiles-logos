-- [[ base16-nvim ]]
-- Color theme

return {
  'dark-beep-boop/base16-nvim',
  config = function()
    vim.cmd.colorscheme 'base16-current'
  end
}

