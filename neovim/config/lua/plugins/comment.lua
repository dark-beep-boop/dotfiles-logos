-- [[ Comment.nvim ]]

return {
	{
		-- Coment visual regions
		'numToStr/Comment.nvim',
		opts = {},
		config = function()
			require('Comment').setup()
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
