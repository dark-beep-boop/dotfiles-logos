-- [[ Neovim config ]]
-- [[ Leaders ]]
vim.g.mapleader = ' '
vim.g.localleader = ' '

-- [[ Plugins ]]
-- Install lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath
  }
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins in plugins directory
require('lazy').setup('plugins')

-- [[ Modules ]]
require('variables')
require('options')
require('keymaps')
require('commands')
