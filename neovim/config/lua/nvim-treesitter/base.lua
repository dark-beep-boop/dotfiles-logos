-- [[ nvim-treesitter setup ]]
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
