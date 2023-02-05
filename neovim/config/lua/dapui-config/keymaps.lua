-- [[ NvimDapUi keymaps ]]
-- [[ Aliases ]]
local keymap = vim.keymap.set

-- [[ Keymaps ]]
keymap('n', '<leader>du', require('dapui').toggle)

-- vim: ts=2 sts=2 sw=2 et
