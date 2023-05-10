require('utils')

-- [[ Neovim config ]]
-- [[ Initial setup ]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if isModuleAvailable('impatient') then
  require('impatient')
end

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

require('lazy').setup({
  -- Fast plugin load
  'lewis6991/impatient.nvim',

  -- Import every other plugin from "plugins" directory
  {import = 'plugins'}
}, {})

require('variables')
require('options')
require('keymaps')
require('commands')
