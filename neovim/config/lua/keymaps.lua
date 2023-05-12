-- [[ Neovim keymaps ]]
-- [[ Aliases ]]
local keymap = vim.keymap.set

-- [[ Defaults ]]
-- Keymaps for better default experience
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Movement ]]
-- Move lines
keymap('i', '<a-j>', [[<esc>:m .+1<cr>==gi]], { noremap = true })
keymap('i', '<a-k>', [[<esc>:m .-2<cr>==gi]], { noremap = true })
keymap('v', '<a-j>', [[:m '>+1<cr>gv=gv]], { noremap = true })
keymap('v', '<a-k>', [[:m '<-2<cr>gv=gv]], { noremap = true })

-- Move split panes
keymap('n', '<a-h>', [[<c-w>H]], { noremap = true })
keymap('n', '<a-j>', [[<c-w>J]], { noremap = true })
keymap('n', '<a-k>', [[<c-w>K]], { noremap = true })
keymap('n', '<a-l>', [[<c-w>L]], { noremap = true })
keymap('n', '<m-left>', [[<c-w>H]], { noremap = true })
keymap('n', '<m-down>', [[<c-w>J]], { noremap = true })
keymap('n', '<m-up>', [[<c-w>K]], { noremap = true })
keymap('n', '<m-right>', [[<c-w>L]], { noremap = true })

-- Move between split panes
keymap('n', '<c-h>', [[<c-w>h]], { noremap = true })
keymap('n', '<c-j>', [[<c-w>j]], { noremap = true })
keymap('n', '<c-k>', [[<c-w>k]], { noremap = true })
keymap('n', '<c-l>', [[<c-w>l]], { noremap = true })
keymap('n', '<c-left>', [[<c-w>h]], { noremap = true })
keymap('n', '<c-down>', [[<c-w>j]], { noremap = true })
keymap('n', '<c-up>', [[<c-w>k]], { noremap = true })
keymap('n', '<c-right>', [[<c-w>l]], { noremap = true })

-- Change split pane size
keymap('n', '<c-m-h>', [[:vertical resize -1.5<cr>]], { noremap = true })
keymap('n', '<c-m-j>', [[:horizontal resize -1.5<cr>]], { noremap = true })
keymap('n', '<c-m-k>', [[:horizontal resize +1.5<cr>]], { noremap = true })
keymap('n', '<c-m-l>', [[:vertical resize +1.5<cr>]], { noremap = true })
keymap('n', '<c-m-left>', [[:vertical resize -1.5<cr>]], { noremap = true })
keymap('n', '<c-m-down>', [[:horizontal resize -1.5<cr>]], { noremap = true })
keymap('n', '<c-m-up>', [[:horizontal resize +1.5<cr>]], { noremap = true })
keymap('n', '<c-m-right>', [[:vertical resize +1.5<cr>]], { noremap = true })

-- [[ Diagnostic ]]
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>e', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)

-- vim: ts=2 sts=2 sw=2 et
