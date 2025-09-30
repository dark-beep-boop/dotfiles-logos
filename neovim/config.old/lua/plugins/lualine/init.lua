-- [[ lualine.nvim ]]

return {
	{
		-- Status line
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			local current_theme = require('plugins.lualine.themes.base16')
			require('plugins.lualine.styles.simple').setup_style(current_theme)
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
