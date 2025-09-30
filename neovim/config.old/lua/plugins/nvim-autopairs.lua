-- [[ nvim-autopairs ]]

return {
	{
		-- Automatically match symbol pairs
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
