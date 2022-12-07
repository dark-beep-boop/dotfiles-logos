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
require('coc.base')
require('lualine.base')
require('neotest.base')
require('nvim-autopairs.base')
require('nvim-dap.base')
require('nvim-dap-ui.base')
require('nvim-dap-virtual-text.base')
require('nvim-tree.base')
require('nvim-treesitter.base')
