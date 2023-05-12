-- [[ nvim-dap ]]

return {
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			-- Creates a beautiful debugger UI
			'rcarriga/nvim-dap-ui',
			'theHamsta/nvim-dap-virtual-text',
			-- Installs the debug adapters for you
			'williamboman/mason.nvim',
			'jay-babu/mason-nvim-dap.nvim',
			-- DAP integration with telescope
			'nvim-telescope/telescope-dap.nvim',
		},
		config = function()
			local dap = require('dap')
			local dapui = require('dapui')

			require('mason-nvim-dap').setup {
				automatic_setup = true,
				handlers = {},
				ensure_installed = {},
			}

			vim.keymap.set('n', '<F5>', dap.continue)
			vim.keymap.set('n', '<F6>', dap.step_into)
			vim.keymap.set('n', '<F7>', dap.step_over)
			vim.keymap.set('n', '<F8>', dap.step_out)
			vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
			vim.keymap.set('n', '<leader>B', function()
				dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
			end)
			vim.keymap.set('n', '<leader>lp', function()
				require('dap').set_breakpoint(
					nil,
					nil,
					vim.fn.input('Log point message: '))
			end)

			dapui.setup {
				icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
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
						disconnect = "⏏",
					},
				},
			}
			vim.keymap.set("n", "<F4>", dapui.toggle)

			dap.listeners.after.event_initialized['dapui_config'] = dapui.open
			dap.listeners.before.event_terminated['dapui_config'] = dapui.close
			dap.listeners.before.event_exited['dapui_config'] = dapui.close

			require('nvim-dap-virtual-text').setup()
		end,
	}
}
