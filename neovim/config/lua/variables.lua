-- [[ variables.lua ]]

-- [[ Colors ]]
vim.g.t_co = 256
vim.g.background = "dark"

-- [[ Plugins ]]
-- Update the packpath
local packer_path = vim.fn.stdpath("config") .. "/site"
vim.o.packpath = vim.o.packpath .. "," .. packer_path

-- [[ Deoplete ]]
vim.api.nvim_command('let g:deoplete#enable_at_startup = 1')
