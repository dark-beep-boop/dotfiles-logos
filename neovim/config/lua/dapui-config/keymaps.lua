-- [[ NvimDapUi keymaps ]]
-- [[ Aliases ]]
local keymap = vim.keymap.set

-- [[ Keymaps ]]
keymap('n', '<leader>du', require('dapui').toggle, { desc = 'DAP UI toggle' })

-- vim: ts=2 sts=2 sw=2 et
