-- [[ vim-latex-live-preview ]]

return {
  {
    'xuhdev/vim-latex-live-preview',
    config = function()
      vim.g.livepreview_previewer = 'zathura'
    end,
  },
}
