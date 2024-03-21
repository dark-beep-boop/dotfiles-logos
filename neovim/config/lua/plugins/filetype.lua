-- [[ filetype.nvim ]]

return {
  {
    -- Filetype extensions
    'nathom/filetype.nvim',
    config = function()
      require('filetype').setup()
    end,
  }
}

-- vim: ts=2 sts=2 sw=2 et
