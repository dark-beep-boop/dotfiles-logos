-- [[ Neovim options ]]
-- [[ Clipboard ]]
vim.o.clipboard = 'unnamedplus'

-- [[ Colors ]]
vim.o.syntax = 'ON'
vim.o.termguicolors = true

-- [[ Update ]]
vim.o.updatetime = 250

-- [[ Context ]]
vim.o.colorcolumn = '80'
vim.wo.number = true
vim.o.relativenumber = false
vim.wo.signcolumn = 'yes'

-- [[ Compatibility ]]
vim.o.compatible = false

-- [[ Completion ]]
vim.o.wildmode = 'longest,list'
vim.o.completeopt = 'menuone,noselect'

-- [[ Format ]]
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.autoindent = true
vim.o.breakindent = true

-- [[ Movement ]]
vim.o.mouse = 'a'
vim.o.ttyfast = true
vim.o.scrolloff = 4

-- [[ Search ]]
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.showmatch = true

-- [[ Window ]]
vim.o.splitright = true
vim.o.splitbelow = true

-- [[ History ]]
vim.o.undofile = true
