-- [[ nvim-autopairs ]]

return {
  {
    -- Automatically match symbol pairs
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  }
}
