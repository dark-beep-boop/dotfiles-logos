-- [[ options.lua ]]

-- [[ Clipboard ]]
vim.opt.mouse = 'v'
vim.opt.clipboard = 'unnamedplus'

-- [[ Colors ]]
vim.opt.syntax = 'ON'
vim.opt.termguicolors = true
vim.api.nvim_command('colorscheme base16-current')

-- [[ Context ]]
vim.opt.colorcolumn = '80'
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = 'yes'

-- [[ Compatibility ]]
vim.opt.compatible = false

-- [[ Completion ]]
vim.opt.wildmode = 'longest,list'

-- [[ Encoding ]]
vim.opt.encoding = 'utf8'
vim.opt.fileencoding = 'utf8'

-- [[ Format ]]
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.textwidth = 80
vim.opt.formatoptions:append('a')

-- [[ Movement ]]
vim.opt.mouse = 'a'
vim.opt.ttyfast = true
vim.opt.scrolloff = 4

-- [[ Search ]]
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmatch = true

-- [[ Window ]]
vim.opt.splitright = true
vim.opt.splitbelow = true
