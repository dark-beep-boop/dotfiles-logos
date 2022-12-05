-- [[ keybindings.lua ]]
local keymap = vim.api.nvim_set_keymap

-- [[ Movement ]]
-- Move lines
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {noremap = true})
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', {noremap = true})
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", {noremap = true})
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", {noremap = true})

-- Move split panes
keymap('n', '<A-h>', '<C-W>H', {noremap = true})
keymap('n', '<A-j>', '<C-W>J', {noremap = true})
keymap('n', '<A-k>', '<C-W>K', {noremap = true})
keymap('n', '<A-l>', '<C-W>L', {noremap = true})
keymap('n', '<M-Left>', '<C-W>H', {noremap = true})
keymap('n', '<M-Down>', '<C-W>J', {noremap = true})
keymap('n', '<M-Up>', '<C-W>K', {noremap = true})
keymap('n', '<M-Right>', '<C-W>L', {noremap = true})

-- Move between split panes 
keymap('n', '<C-h>', '<C-w>h', {noremap = true})
keymap('n', '<C-j>', '<C-w>j', {noremap = true})
keymap('n', '<C-k>', '<C-w>k', {noremap = true})
keymap('n', '<C-l>', '<C-w>l', {noremap = true})
keymap('n', '<C-Left>', '<C-w>h', {noremap = true})
keymap('n', '<C-Down>', '<C-w>j', {noremap = true})
keymap('n', '<C-Up>', '<C-w>k', {noremap = true})
keymap('n', '<C-Right>', '<C-w>l', {noremap = true})

-- [[ nvim-tree ]]
-- Toggle nvim-tree
keymap('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})

-- [[ indentLine ]]
-- Toggle indent lines
keymap('n', '<C-M-l>', [[:IndentLinesToggle<CR>]], {})

-- [[ tagbar ]]
-- Toggle tagbar
keymap('n', '<C-s>', [[:TagbarToggle<CR>]], {})

-- [[ telescope ]]
-- Start telescope
keymap('n', '<A-f>', [[:Telescope find_files<CR>]], {})

-- [[ floaterm ]]
-- Normal mode
-- Open new terminal
keymap('n', '<F7>', [[:FloatermNew --height=0.2 --wintype=split<CR>]], {noremap = true})
-- Move between terminals
keymap('n', '<F8>', [[:FloatermPrev<CR>]], {noremap = true})
keymap('n', '<F9>', [[:FloatermNext<CR>]], {noremap = true})
keymap('n', '<F10>', [[:FloatermToggle<CR>]], {noremap = true})
keymap('n', '<F12>', [[:FloatermKill<CR>]], {noremap = true})

-- Terminal mode
-- Open new terminal
keymap('t', '<F7>', [[<C-\><C-n>:FloatermNew --height=0.2 --wintype=split<CR>]], {noremap = true})
-- Move between terminals
keymap('t', '<F8>', [[<C-\><C-n>:FloatermPrev<CR>]], {noremap = true})
keymap('t', '<F9>', [[<C-\><C-n>:FloatermNext<CR>]], {noremap = true})
keymap('t', '<F10>', [[<C-\><C-n>:FloatermToggle<CR>]], {noremap = true})
keymap('t', '<F12>', [[<C-\><C-n>:FloatermKill<CR>]], {noremap = true})
