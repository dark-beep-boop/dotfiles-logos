-- [[ NvimDap keymaps ]]
-- [[ Aliases ]]
local keymap = vim.keymap.set

-- [[ Keymaps ]]
keymap('n', '<F5>', require('dap').continue)
keymap('n', '<F6>', require('dap').step_over)
keymap('n', '<F7>', require('dap').step_into)
keymap('n', '<F8>', require('dap').step_out)
keymap('n', '<leader>b', require('dap').toggle_breakpoint)
keymap('n', '<leader>B', function()
  require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
keymap('n', '<leader>lp', function()
  require('dap').set_breakpoint( nil, nil,
    vim.fn.input('Log point message: '))
end)

-- vim: ts=2 sts=2 sw=2 et
