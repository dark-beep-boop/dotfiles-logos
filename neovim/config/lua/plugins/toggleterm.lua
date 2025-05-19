-- [[ Toggleterm ]]

return {
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		keys = {
			-- Normal mode
			{
				'<leader>tt',
				[[:ToggleTerm direction=tab<cr>]],
				desc = 'Toggle tabbed terminal',
			},
			{
				'<leader>tf',
				[[:ToggleTerm direction=float<cr>]],
				desc = 'Toggle floating terminal',
			},
			{
				'<leader>th',
				[[:ToggleTerm direction=horizontal<cr>]],
				desc = 'Toggle horizontal terminal',
			},
			{
				'<leader>tv',
				[[:ToggleTerm direction=vertical<cr>]],
				desc = 'Toggle vertical terminal',
			},
			{
				'<leader>ta',
				[[:ToggleTermToggleAll<cr>]],
				desc = 'Toggle all terminals',
			},

			-- Terminal mode
			{ '<esc>', [[<c-\><c-n>]], mode = 't', desc = 'Exit terminal' },
			{
				'<leader>tt',
				[[<c-\><c-n>:ToggleTerm direction=tab<cr>]],
				mode = 't',
				desc = 'Toggle tabbed terminal',
			},
			{
				'<leader>tf',
				[[<c-\><c-n>:ToggleTerm direction=float<cr>]],
				mode = 't',
				desc = 'Toggle floating terminal',
			},
			{
				'<leader>th',
				[[<c-\><c-n>:ToggleTerm direction=horizontal<cr>]],
				mode = 't',
				desc = 'Toggle horizontal terminal',
			},
			{
				'<leader>tv',
				[[<c-\><c-n>:ToggleTerm direction=vertical<cr>]],
				mode = 't',
				desc = 'Toggle vertical terminal',
			},
			{
				'<leader>ta',
				[[<c-\><c-n>:ToggleTermToggleAll<cr>]],
				mode = 't',
				desc = 'Toggle all terminals',
			},
			{
				'<leader>tk',
				[[<c-\><c-n>:q<cr>]],
				mode = 't',
				desc = 'Kill terminal',
			},
		},
		config = function()
			require('toggleterm').setup()
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
