-- [[ nvim-dap ]]

require('plugins.dap.scan-adapters')
DapAdaptersParameters = ScanDAPAdapterParametersInDirectory(
	'/home/zus/.config/nvim/lua/plugins/dap/dap-adapters',
	'plugins.dap.dap-adapters'
)

return {
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'nvim-neotest/nvim-nio',
			-- Creates a beautiful debugger UI
			'rcarriga/nvim-dap-ui',
			'theHamsta/nvim-dap-virtual-text',
			-- Installs the debug adapters for you
			'williamboman/mason.nvim',
			'jay-babu/mason-nvim-dap.nvim',
			-- DAP integration with telescope
			'nvim-telescope/telescope-dap.nvim',
			'https://github.com/nvim-neotest/nvim-nio',
			DapAdaptersParameters.dependencies,
		},
		keys = {
			{
				'<F5>',
				function()
					require('dap').continue()
				end,
				desc = 'Debug: Start/Continue',
			},
			{
				'<F6>',
				function()
					require('dap').step_into()
				end,
				desc = 'Debug: Step into',
			},
			{
				'<F7>',
				function()
					require('dap').step_over()
				end,
				desc = 'Debug: Step over',
			},
			{
				'<F8>',
				function()
					require('dap').step_out()
				end,
				desc = 'Debug: Step out',
			},
			{
				'<leader>b',
				function()
					require('dap').toggle_breakpoint()
				end,
				desc = 'Debug: Toggle breakpoint',
			},
			{
				'<leader>B',
				function()
					require('dap').set_breakpoint(
						vim.fn.input('Breakpoint condition: ')
					)
				end,
				desc = 'Debug: Set conditional breakpoint',
			},
			{
				'<leader>lp',
				function()
					require('dap').set_breakpoint(
						nil,
						nil,
						vim.fn.input('Log point message: ')
					)
				end,
				desc = 'Debug: Set log point',
			},
			{
				'<F4>',
				function()
					require('dapui').toggle()
				end,
				desc = 'Debug: See last session result',
			},
		},
		config = function(_, opts)
			local dap = require('dap')
			local dapui = require('dapui')

			require('mason-nvim-dap').setup({
				automatic_installation = true,
				handlers = {},
				ensure_installed = DapAdaptersParameters.adapters,
			})

			dapui.setup({
				icons = {
					expanded = '▾',
					collapsed = '▸',
					current_frame = '*',
				},
				controls = {
					icons = {
						pause = '⏸',
						play = '▶',
						step_into = '⏎',
						step_over = '⏭',
						step_out = '⏮',
						step_back = 'b',
						run_last = '▶▶',
						terminate = '⏹',
						disconnect = '⏏',
					},
				},
			})

			dap.listeners.after.event_initialized['dapui_config'] = dapui.open
			dap.listeners.before.event_terminated['dapui_config'] = dapui.close
			dap.listeners.before.event_exited['dapui_config'] = dapui.close

			for _, adapter_config in ipairs(DapAdaptersParameters.configs) do
				adapter_config(_, opts)
			end
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
