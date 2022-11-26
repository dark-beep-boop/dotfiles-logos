-- [[ init.lua ]]
require('impatient')

-- [[ Leaders ]]
vim.g.mapleader = ','
vim.g.localleaders = '\\'

-- [[ Modules ]]
require('variables')
require('options')
require('keybindings')
require('plugins')

-- [[ Plugins ]]
require('nvim-tree.base')
require('lualine.base')
require('lualine.bubbles')
require('nvim-autopairs.base')
