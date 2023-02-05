-- [[ Tagbar keymaps ]]
-- [[ Aliases ]]
local keymap = vim.keymap.set

-- [[ Keymaps ]]
keymap('n', '<leader>c', [[:TagbarToggle<cr>]], {desc = 'Tagbar toggle'})

-- vim: ts=2 sts=2 sw=2 et
