-- [[ mini.nvim ]]

return {
	{
		-- Collection of various small independent plugins/modules
		'echasnovski/mini.nvim',
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - Visually select around paren
			--  - yinq - Yank inside next quote
			--  - ci'  - Change inside quote
			require('mini.ai').setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - Surround add inner word paren
			-- - sd'   - Surround delete quotes
			-- - sr)'  - Surround replace paren with quotes
			require('mini.surround').setup()
		end,
	},
}
