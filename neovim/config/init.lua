-- [[ Neovim config ]]
-- [[ Leaders ]]
vim.g.mapleader = ' '
vim.g.localleader = ' '

-- [[ Plugins ]]
-- Install lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins in plugins directory
require('lazy').setup('plugins', {
	ui = {
		-- If using a Nerd Font set icons to an empty table which will use
		-- the default lazy.nvim defined Nerd Font icons, otherwise define a unicode
		-- icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = '⌘',
			config = '',
			event = '',
			ft = '',
			init = '⚙',
			keys = '',
			plugin = '',
			runtime = '',
			require = '',
			source = '',
			start = '',
			task = '',
			lazy = 'zzZ',
		},
	},
})

-- [[ Modules ]]
require('variables')
require('options')
require('keymaps')
require('commands')

-- vim: ts=2 sts=2 sw=2 et
