-- [[ texlab ]]

return {
	texlab = {
		auxDirectory = ".",
		bibtexFormatter = "texlab",
		build = {
			args = {
				"-pdf",
				"-interaction=nonstopmode",
				"-synctex=1",
				"%f"
			},
			executable = "latex",
			forwardSearchAfter = false,
			onSave = false
		},
		chktex = {
			onEdit = false,
			onOpenAndSave = false
		},
		diagnosticsDelay = 300,
		formatterLineLength = 80,
		forwardSearch = {
			args = {}
		},
		latexFormatter = "latexindent",
		latexindent = {
			modifyLineBreaks = false
		}
	},
}

-- vim: ts=2 sts=2 sw=2 et
