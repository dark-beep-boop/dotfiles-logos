-- [[ nvim-treesitter ]]

return {
	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
		build = ':TSUpdate',
		main = 'nvim-treesitter.configs',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = {
					'c',
					'cpp',
					'go',
					'lua',
					'python',
					'rust',
					'tsx',
					'typescript',
					'vimdoc',
					'vim',
				},

				-- Autoinstall uninstalled languages
				auto_install = true,
				highlight = {
					enable = true,

					-- Some languages depend on vim's regex highlighting system (such as
					-- Ruby) for indent rules.
					--
					-- If you are experiencing weird indenting issues, add the language to
					-- the list of additional_vim_regex_highlighting and disabled
					-- languages for indent.
					additional_vim_regex_highlighting = { 'ruby' },
				},
				indent = { enable = true, disable = { 'ruby' } },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<c-space>',
						node_incremental = '<c-space>',
						scope_incremental = '<c-s>',
						node_decremental = '<M-space>',
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							['aa'] = '@parameter.outer',
							['ia'] = '@parameter.inner',
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							[']m'] = '@function.outer',
							[']]'] = '@class.outer',
						},
						goto_next_end = {
							[']M'] = '@function.outer',
							[']['] = '@class.outer',
						},
						goto_previous_start = {
							['[m'] = '@function.outer',
							['[['] = '@class.outer',
						},
						goto_previous_end = {
							['[M'] = '@function.outer',
							['[]'] = '@class.outer',
						},
					},
					swap = {
						enable = true,
						swap_next = {
							['<leader>a'] = '@parameter.inner',
						},
						swap_previous = {
							['<leader>A'] = '@parameter.inner',
						},
					},
				},
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
