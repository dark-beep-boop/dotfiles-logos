-- [[ Neovim keymaps ]]
-- [[ Aliases ]]
local keymap = vim.keymap.set

-- [[ Defaults ]]
-- Keymaps for better default experience
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Spanish dvorak movement keys adjusted
keymap({ 'n', 'v' }, 'h', 'r', { silent = true })
keymap({ 'n', 'v' }, 'j', 't', { silent = true })
keymap({ 'n', 'v' }, 'k', 'n', { silent = true })
keymap({ 'n', 'v' }, 'l', 's', { silent = true })
keymap({ 'n', 'v' }, 'gj', 'gt', { silent = true })
keymap({ 'n', 'v' }, 'gk', 'gn', { silent = true })

keymap({ 'n', 'v' }, 'r', 'h', { silent = true })
keymap({ 'n', 'v' }, 't', 'j', { silent = true })
keymap({ 'n', 'v' }, 'n', 'k', { silent = true })
keymap({ 'n', 'v' }, 's', 'l', { silent = true })
keymap({ 'n', 'v' }, 'gt', 'gj', { silent = true })
keymap({ 'n', 'v' }, 'gn', 'gk', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 't', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap('n', 'n', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- [[ Movement ]]
-- Move lines
keymap('i', '<a-t>', [[<esc>:m .+1<cr>==gi]])
keymap('i', '<a-n>', [[<esc>:m .-2<cr>==gi]])
keymap('i', '<a-down>', [[<esc>:m .+1<cr>==gi]])
keymap('i', '<a-up>', [[<esc>:m .-2<cr>==gi]])

keymap('v', '<a-t>', [[:m '>+1<cr>gv=gv]])
keymap('v', '<a-n>', [[:m '<-2<cr>gv=gv]])
keymap('v', '<a-down>', [[:m '>+1<cr>gv=gv]])
keymap('v', '<a-up>', [[:m '<-2<cr>gv=gv]])

-- Move split panes
keymap('n', '<a-r>', [[<c-w>H]])
keymap('n', '<a-t>', [[<c-w>J]])
keymap('n', '<a-n>', [[<c-w>K]])
keymap('n', '<a-s>', [[<c-w>L]])
keymap('n', '<a-left>', [[<c-w>H]])
keymap('n', '<a-down>', [[<c-w>J]])
keymap('n', '<a-up>', [[<c-w>K]])
keymap('n', '<a-right>', [[<c-w>L]])

-- Move between split panes
keymap('n', '<c-r>', [[<c-w>h]])
keymap('n', '<c-t>', [[<c-w>j]])
keymap('n', '<c-n>', [[<c-w>k]])
keymap('n', '<c-s>', [[<c-w>l]])
keymap('n', '<c-left>', [[<c-w>h]])
keymap('n', '<c-down>', [[<c-w>j]])
keymap('n', '<c-up>', [[<c-w>k]])
keymap('n', '<c-right>', [[<c-w>l]])

-- Change split pane size
keymap('n', '<c-m-r>', [[:vertical resize -1.5<cr>]])
keymap('n', '<c-m-t>', [[:horizontal resize -1.5<cr>]])
keymap('n', '<c-m-n>', [[:horizontal resize +1.5<cr>]])
keymap('n', '<c-m-s>', [[:vertical resize +1.5<cr>]])
keymap('n', '<c-m-left>', [[:vertical resize -1.5<cr>]])
keymap('n', '<c-m-down>', [[:horizontal resize -1.5<cr>]])
keymap('n', '<c-m-up>', [[:horizontal resize +1.5<cr>]])
keymap('n', '<c-m-right>', [[:vertical resize +1.5<cr>]])

-- [[ Diagnostic ]]
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>e', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)

-- vim: ts=2 sts=2 sw=2 et
