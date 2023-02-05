-- [[ Neovim config ]]
-- [[ Initial setup ]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
pcall(require 'impatient')

-- [[ Leaders ]]
vim.g.mapleader = ' '
vim.g.localleader = ' '

-- [[ Modules ]]
require 'plugins'
require 'variables'
require 'options'
require 'keymaps'

-- [[ Setup ]]
-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {
  clear = true
})
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*'
})

-- vim: ts=2 sts=2 sw=2 et
