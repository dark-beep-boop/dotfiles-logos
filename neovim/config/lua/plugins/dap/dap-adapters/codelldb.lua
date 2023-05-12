-- [[ codelldb dap adapter ]]

return {
	adapters = { 'codelldb' },
	config = function()
		local dap = require('dap')
		dap.adapters.codelldb = {
			type = 'server',
			port = "${port}",
			executable = {
				-- CHANGE THIS to your path!
				command = '/absolute/path/to/codelldb/extension/adapter/codelldb',
				args = { "--port", "${port}" },
			}
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
}

-- vim: ts=2 sts=2 sw=2 et
