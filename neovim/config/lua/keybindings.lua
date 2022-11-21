-- Move line or visually selected block - alt+j/k
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", {noremap = true})
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", {noremap = true})
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", {noremap = true})

-- Move split panes to left/bottom/top/right
vim.api.nvim_set_keymap("n", "<A-h>", "<C-W>H", {noremap = true})
vim.api.nvim_set_keymap("n", "<A-j>", "<C-W>J", {noremap = true})
vim.api.nvim_set_keymap("n", "<A-k>", "<C-W>K", {noremap = true})
vim.api.nvim_set_keymap("n", "<A-l>", "<C-W>L", {noremap = true})

-- Move split panes to left/bottom/top/right
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true})

-- Toggle nvim-tree
vim.api.nvim_set_keymap("n", "<C-n>", [[:NvimTreeToggle<Enter>]], {})
