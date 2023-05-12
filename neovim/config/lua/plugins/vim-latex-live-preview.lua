-- [[ vim-latex-live-preview ]]

return {
  {
    'xuhdev/vim-latex-live-preview',
    config = function()
      vim.g.livepreview_previewer = 'zathura'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
