-- [[ nvim-treesitter setup ]]
--vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  --group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  --callback = function()
    --vim.opt.foldmethod     = 'expr'
    --vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  --end
--})

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'lua', 'python', 'bash', 'latex' },
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
  },

  textobjects = {
    enable = true,
  },
}
