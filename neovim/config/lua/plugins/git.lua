-- [[ Git magagement ]]

return {
	-- Git tools
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'junegunn/gv.vim',
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup({
				signs = {
					add = { text = '+' },
					change = { text = '~' },
					delete = { text = '_' },
					topdelete = { text = '‾' },
					changedelete = { text = '~' },
				},
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
