-- [[ tagbar ]]

return {
	{
		'preservim/tagbar',
		keys = {
			{ '<leader>c', [[:TagbarToggle<cr>]], desc = 'Tagbar toggle', },
		}
	}
}

-- vim: ts=2 sts=2 sw=2 et
