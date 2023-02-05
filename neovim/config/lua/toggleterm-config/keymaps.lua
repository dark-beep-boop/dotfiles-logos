-- [[ Floaterm keymaps ]]
-- [[ Aliases ]]
local keymap = vim.keymap.set

-- [[ Keymaps ]]
-- Normal mode
keymap('n', '<leader>tt', [[:ToggleTerm direction=tab<cr>]], {
  desc = 'Toggle tabbed terminal'
})
keymap('n', '<leader>tf', [[:ToggleTerm direction=float<cr>]], {
  desc = 'Toggle floating terminal'
})
keymap('n', '<leader>th', [[:ToggleTerm direction=horizontal<cr>]], {
  desc = 'Toggle horizontal terminal'
})
keymap('n', '<leader>tv', [[:ToggleTerm direction=vertical<cr>]], {
  desc = 'Toggle vertical terminal'
})
keymap('n', '<leader>ta', [[:ToggleTermToggleAll<cr>]], {
  desc = 'Toggle all terminals'
})

-- Terminal mode
keymap('t', '<esc>', [[<c-\><c-n>]], { desc = 'Exit terminal' })
keymap('t', '<leader>tk', [[<c-\><c-n>:q<cr>]], {
  desc = 'Kill terminal'
})
keymap('t', '<leader>ta', [[<c-\><c-n>:ToggleTermToggleAll<cr>]], {
  desc = 'Toggle all terminals'
})

-- vim: ts=2 sts=2 sw=2 et
