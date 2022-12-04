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
vim.api.nvim_set_keymap('n', '<M-Left>', '<C-W>H', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Down>', '<C-W>J', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Up>', '<C-W>K', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Right>', '<C-W>L', {noremap = true})

-- Move between split panes 
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', {noremap = true})

-- [[ Plugins ]]
-- Toggle nvim-tree
vim.api.nvim_set_keymap('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})
-- Toggle indent lines
vim.api.nvim_set_keymap('n', '<C-M-l>', [[:IndentLinesToggle<CR>]], {})
-- Toggle tagbar
vim.api.nvim_set_keymap('n', '<C-s>', [[:TagbarToggle<CR>]], {})
-- Start telescope
vim.api.nvim_set_keymap('n', '<A-f>', [[:Telescope find_files<CR>]], {})
-- Open new terminal
vim.api.nvim_set_keymap(
  'n',
  '<F7>',
  [[:FloatermNew --height=0.2 --wintype=split<CR>]],
  {noremap = true})
vim.api.nvim_set_keymap(
  't',
  '<F7>',
  [[<C-\><C-n>:FloatermNew --height=0.2 --wintype=split<CR>]],
  {noremap = true})
-- Move between terminals
vim.api.nvim_set_keymap(
  'n', 
  '<F8>', 
  [[:FloatermPrev<CR>]], 
  {noremap = true})
vim.api.nvim_set_keymap(
  't',
  '<F8>',
  [[<C-\><C-n>:FloatermPrev<CR>]],
  {noremap = true})
vim.api.nvim_set_keymap(
  'n', 
  '<F9>', 
  [[:FloatermNext<CR>]], 
  {noremap = true})
vim.api.nvim_set_keymap(
  't', 
  '<F9>', 
  [[<C-\><C-n>:FloatermNext<CR>]], 
  {noremap = true})
vim.api.nvim_set_keymap(
  'n', 
  '<F10>', 
  [[:FloatermToggle<CR>]], 
  {noremap = true})
vim.api.nvim_set_keymap(
  't', 
  '<F10>', 
  [[<C-\><C-n>:FloatermToggle<CR>]], 
  {noremap = true})
vim.api.nvim_set_keymap(
  'n', 
  '<F12>', 
  [[:FloatermKill<CR>]], 
  {noremap = true})
vim.api.nvim_set_keymap(
  't', 
  '<F12>', 
  [[<C-\><C-n>:FloatermKill<CR>]], 
  {noremap = true})
