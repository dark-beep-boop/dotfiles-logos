-- [[ keybindings.lua ]]

-- [[ Movement ]]
-- Move lines
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {noremap = true})
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', {noremap = true})
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", {noremap = true})

-- Move split panes
vim.api.nvim_set_keymap('n', '<A-h>', '<C-W>H', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-j>', '<C-W>J', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-k>', '<C-W>K', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-l>', '<C-W>L', {noremap = true})

-- Move between split panes 
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})

-- [[ Plugins ]]
-- Toggle nvim-tree
vim.api.nvim_set_keymap('n', '<C-M-n>', [[<Esc>:NvimTreeToggle<CR>]], {})
-- Toggle indent lines
vim.api.nvim_set_keymap('n', '<C-M-l>', [[<Esc>:IndentLinesToggle<CR>]], {})
-- Toggle tagbar
vim.api.nvim_set_keymap('n', '<C-M-t>', [[<Esc>:TagbarToggle<CR>]], {})
-- Start telescope
vim.api.nvim_set_keymap('n', '<C-M-f>', [[<Esc>:Telescope find_files<CR>]], {})
