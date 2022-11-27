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
require('nvim-lspconfig.base')
require('nvim-cmp.base')
require('nvim-tree.base')
require('lualine.base')
require('nvim-autopairs.base')
