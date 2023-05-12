-- [[ Git magagement ]]

return {
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'junegunn/gv.vim',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
		require('gitsigns').setup {
		  signs = {
		    add = { text = '+' },
		    change = { text = '~' },
		    delete = { text = '_' },
		    topdelete = { text = '‾' },
		    changedelete = { text = '~' }
		  }
		}
    end,
  },
}
