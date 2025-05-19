-- [[ indent-blankline.nvim ]]

return {
	{
		-- Add indentation guides
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		config = function()
			require('ibl').setup({
				indent = { char = '┊' },
				whitespace = { remove_blankline_trail = false },
				scope = { enabled = false },
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
