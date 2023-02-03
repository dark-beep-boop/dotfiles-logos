-- [[ init.lua ]]
require('impatient')

-- [[ Leaders ]]
vim.g.mapleader = ','
vim.g.localleaders = '\\'

-- [[ Modules ]]
require('variables')
require('options')
require('plugins')
require('config')
require('keymaps')
