-- [[ NvimTree keymaps ]]
-- [[ Aliases ]]
local keymap = vim.keymap.set

-- [[ Keymaps ]]
-- Toggle nvim-tree
keymap('n', '<leader>n', [[:NvimTreeToggle<cr>]], {
  noremap = true,
  desc = 'Toggle NvimTree'
})

-- vim: ts=2 sts=2 sw=2 et
