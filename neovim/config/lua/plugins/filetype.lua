-- [[ filetype.nvim ]]

return {
  {
    -- Filetype extensions
    'nathom/filetype.nvim',
    opts = {},
    config = function()
      require('filetype').setup({
        overrides = {
          function_extensions = {
            ["cppm"] = function()
              vim.bo.filetype = "cpp"
              -- Remove annoying indent jumping
              vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
            end,
          }
        }
      })
    end,
  }
}

-- vim: ts=2 sts=2 sw=2 et
