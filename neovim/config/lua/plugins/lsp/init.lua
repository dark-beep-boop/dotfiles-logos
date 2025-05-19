-- [[ nvim-lspconfig ]]

require('plugins.lsp.scan-servers')

return {
	{
		-- Lua LSP for Neovim config, runtime and plugins
		'folke/lazydev.nvim',
		ft = 'lua',
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
			},
		},
	},

	{
		-- Language Server Protocol
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', opts = {} },
			'williamboman/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',
			{ 'j-hui/fidget.nvim', opts = {} },
			'saghen/blink.cmp',
		},
		config = function()
			-- Whenever an LSP attaches to a buffer, we will run this function.
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup(
					'lsp-attach',
					{ clear = true }
				),
				-- This is where we attach the autoformatting
				callback = function(event)
					-- Function to define mappings
					local map = function(keys, func, desc, mode)
						mode = mode or 'n'
						vim.keymap.set(
							mode,
							keys,
							func,
							{ buffer = event.buf, desc = 'LSP: ' .. desc }
						)
					end

					-- Rename the variable under your cursor.
					-- Most Language Servers support renaming across files, etc.
					map('grn', vim.lsp.buf.rename, 'Rename')

					-- Execute a code action, usually your cursor needs to be on top of an
					-- error or a suggestion from your LSP for this to activate.
					map(
						'gra',
						vim.lsp.buf.code_action,
						'Goto code action',
						{ 'n', 'x' }
					)

					-- Find references for the word under your cursor.
					map(
						'grr',
						require('telescope.builtin').lsp_references,
						'Goto references'
					)

					-- Jump to the implementation of the word under your cursor.
					-- Useful when your language has ways of declaring types without an
					-- actual implementation.
					map(
						'gri',
						require('telescope.builtin').lsp_implementations,
						'Goto implementation'
					)

					-- Jump to the definition of the word under your cursor.
					-- This is where a variable was first declared, or where a function is
					-- defined, etc.
					-- To jump back, press <C-t>.
					map(
						'grd',
						require('telescope.builtin').lsp_definitions,
						'Goto definition'
					)

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					-- For example, in C this would take you to the header.
					map('grD', vim.lsp.buf.declaration, 'Goto declaration')

					-- Fuzzy find all the symbols in your current document.
					-- Symbols are things like variables, functions, types, etc.
					map(
						'gO',
						require('telescope.builtin').lsp_document_symbols,
						'Open document symbols'
					)

					-- Fuzzy find all the symbols in your current workspace.
					-- Similar to document symbols, except searches over your entire
					-- project.
					map(
						'gW',
						require('telescope.builtin').lsp_dynamic_workspace_symbols,
						'Open workspace symbols'
					)

					-- Jump to the type of the word under your cursor.
					-- Useful when you're not sure what type a variable is and you want to
					-- see the definition of its *type*, not where it was *defined*.
					map(
						'grt',
						require('telescope.builtin').lsp_type_definitions,
						'Goto type definition'
					)

					-- This function resolves a difference between neovim nightly (version
					-- 0.11) and stable (version 0.10)
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific
					--- files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has('nvim-0.11') == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(
								method,
								{ bufnr = bufnr }
							)
						end
					end

					-- The following two autocommands are used to highlight references of
					-- the word under your cursor when your cursor rests there for a
					-- little while.
					-- See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the
					-- second autocommand).
					local client =
						vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
						local highlight_augroup = vim.api.nvim_create_augroup(
							'lsp-highlight',
							{ clear = false }
						)
						vim.api.nvim_create_autocmd(
							{ 'CursorHold', 'CursorHoldI' },
							{
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.document_highlight,
							}
						)

						vim.api.nvim_create_autocmd(
							{ 'CursorMoved', 'CursorMovedI' },
							{
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.clear_references,
							}
						)

						vim.api.nvim_create_autocmd('LspDetach', {
							group = vim.api.nvim_create_augroup(
								'lsp-detach',
								{ clear = true }
							),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({
									group = 'lsp-highlight',
									buffer = event2.buf,
								})
							end,
						})
					end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_inlayHint,
							event.buf
						)
					then
						map('<leader>th', function()
							vim.lsp.inlay_hint.enable(
								not vim.lsp.inlay_hint.is_enabled({
									bufnr = event.buf,
								})
							)
						end, 'Toggle inlay hints')
					end
				end,
			})

			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = 'rounded', source = 'if_many' },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = '󰅚 ',
						[vim.diagnostic.severity.WARN] = '󰀪 ',
						[vim.diagnostic.severity.INFO] = '󰋽 ',
						[vim.diagnostic.severity.HINT] = '󰌶 ',
					},
				} or {},
				virtual_text = {
					source = 'if_many',
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			-- LSP servers and clients are able to communicate to each other what
			-- features they support.
			--
			-- By default, Neovim doesn't support everything that is in the LSP
			-- specification. When you add blink.cmp, luasnip, etc. Neovim now has
			-- *more* capabilities.
			--
			-- So, we create new capabilities with blink.cmp, and
			-- then broadcast that to the servers.
			local capabilities = require('blink.cmp').get_lsp_capabilities()

			-- Scan LSP server configurations in directory lsp-servers
			local servers = ScanLSPServersInDirectory(
				'/home/zus/.config/nvim/lua/plugins/lsp/lsp-servers',
				'plugins.lsp.lsp-servers'
			)

			-- Ensure the servers and tools above are installed
			--
			-- To check the current status of installed tools and/or manually install
			-- other tools, you can run
			--    :Mason
			--
			-- You can press `g?` for help in this menu.
			--
			-- `mason` had to be setup earlier: to configure its options see the
			-- `dependencies` table for `nvim-lspconfig` above.
			--
			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, { 'stylua' })
			require('mason-tool-installer').setup({
				ensure_installed = ensure_installed,
			})

			require('mason-lspconfig').setup({
				-- explicitly set to an empty table (this config populates installs via
				-- mason-tool-installer)
				ensure_installed = {},
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting
						-- for ts_ls)
						server.capabilities = vim.tbl_deep_extend(
							'force',
							{},
							capabilities,
							server.capabilities or {}
						)
						require('lspconfig')[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{ -- Autoformat
		'stevearc/conform.nvim',
		event = { 'BufWritePre' },
		cmd = { 'ConformInfo' },
		keys = {
			{
				'<leader>f',
				function()
					require('conform').format({
						async = true,
						lsp_format = 'fallback',
					})
				end,
				mode = '',
				desc = 'Format buffer',
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 500,
						lsp_format = 'fallback',
					}
				end
			end,
			formatters_by_ft = {
				lua = { 'stylua' },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use 'stop_after_first' to run the first available formatter
				-- from the list
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},

	{ -- Autocompletion
		'saghen/blink.cmp',
		event = 'VimEnter',
		version = '1.*',
		dependencies = {
			-- Snippet Engine
			{
				'L3MON4D3/LuaSnip',
				version = '2.*',
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if
						vim.fn.has('win32') == 1
						or vim.fn.executable('make') == 0
					then
						return
					end
					return 'make install_jsregexp'
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					-- See the README about individual language/framework/plugin
					-- snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					{
						'rafamadriz/friendly-snippets',
						config = function()
							require('luasnip.loaders.from_vscode').lazy_load()
						end,
					},
				},
				opts = {},
			},
			'folke/lazydev.nvim',
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				-- 'default' (recommended) for mappings similar to built-in completions
				--   <c-y> to accept ([y]es) the completion.
				--    This will auto-import if your LSP supports it.
				--    This will expand snippets if the LSP sent a snippet.
				-- 'super-tab' for tab to accept
				-- 'enter' for enter to accept
				-- 'none' for no mappings
				--
				-- For an understanding of why the 'default' preset is recommended,
				-- you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really
				-- good!
				--
				-- All presets have the following mappings:
				-- <tab>/<s-tab>: move to right/left of your snippet expansion
				-- <c-space>: Open menu or open docs if already open
				-- <c-n>/<c-p> or <up>/<down>: Select next/previous item
				-- <c-e>: Hide menu
				-- <c-k>: Toggle signature help
				--
				-- See :h blink-cmp-config-keymap for defining your own keymap
				preset = 'default',

				-- For more advanced Luasnip keymaps (e.g. selecting choice nodes,
				-- expansion) see:
				--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = 'mono',
			},

			completion = {
				-- By default, you may press `<c-space>` to show the documentation.
				-- Optionally, set `auto_show = true` to show the documentation after a
				-- delay.
				documentation = { auto_show = false, auto_show_delay_ms = 500 },
			},

			sources = {
				default = { 'lsp', 'path', 'snippets', 'lazydev' },
				providers = {
					lazydev = {
						module = 'lazydev.integrations.blink',
						score_offset = 100,
					},
				},
			},

			snippets = { preset = 'luasnip' },

			-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
			-- which automatically downloads a prebuilt binary when enabled.
			--
			-- By default, we use the Lua implementation instead, but you may enable
			-- the rust implementation via `'prefer_rust_with_warning'`
			--
			-- See :h blink-cmp-config-fuzzy for more information
			fuzzy = { implementation = 'lua' },

			-- Shows a signature help window while you type arguments for a function
			signature = { enabled = true },
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
