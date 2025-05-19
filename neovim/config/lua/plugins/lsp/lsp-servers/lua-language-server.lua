-- [[ lua-language-server ]]

return {
	lua_ls = {
		Lua = {
			completion = { callSnippet = 'Replace' },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = { disable = { 'missing-fields' } },
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
