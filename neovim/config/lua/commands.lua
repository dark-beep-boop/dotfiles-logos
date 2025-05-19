-- [[ Neovim commands ]]

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.hl.on_yank()
	end,
	group = vim.api.nvim_create_augroup('yank-highlight', { clear = true }),
	pattern = '*',
})

-- vim: ts=2 sts=2 sw=2 et
