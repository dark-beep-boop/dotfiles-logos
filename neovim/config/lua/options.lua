-- [[ options.lua ]]

-- [[ Clipboard ]]
vim.opt.clipboard = 'unnamedplus'

-- [[ Colors ]]
vim.opt.syntax = 'ON'
vim.opt.termguicolors = true
vim.api.nvim_command('colorscheme base16-current')

-- [[ Update ]]
vim.opt.updatetime = 250

-- [[ Context ]]
vim.opt.colorcolumn = '80'
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = 'yes'

-- [[ Compatibility ]]
vim.opt.compatible = false

-- [[ Completion ]]
vim.opt.wildmode = 'longest,list'
vim.opt.completeopt = 'menuone,noselect'

-- [[ Encoding ]]
vim.opt.encoding = 'utf8'
vim.opt.fileencoding = 'utf8'

-- [[ Format ]]
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.breakindent = true

-- [[ Movement ]]
vim.opt.mouse = 'a'
vim.opt.ttyfast = true
vim.opt.scrolloff = 4

-- [[ Search ]]
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.showmatch = true

-- [[ Window ]]
vim.opt.splitright = true
vim.opt.splitbelow = true

-- [[ History ]]
vim.opt.undofile = true

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
