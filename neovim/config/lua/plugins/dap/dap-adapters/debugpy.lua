-- [[ debugpy dap adapter ]]

return {
	dependencies = { 'mfussenegger/nvim-dap-python' },
	config = function()
		require('dap-python').setup('/home/zus/.virtualenvs/debugpy/bin/python')
		require('dap-python').test_runner = 'pytest'

		vim.keymap.set('n', '<leader>dn', require('dap-python').test_method)
		vim.keymap.set('n', '<leader>df', require('dap-python').test_class)
	end,
}

-- vim: ts=2 sts=2 sw=2 et
