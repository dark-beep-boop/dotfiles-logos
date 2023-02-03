-- [[ variables.lua ]]

-- [[ Colors ]]
vim.g.t_co = 256
vim.g.background = "dark"

-- [[ Plugins ]]
-- Update the packpath
local packer_path = vim.fn.stdpath("config") .. "/site"
vim.o.packpath = vim.o.packpath .. "," .. packer_path

-- [[ Markdown ]]
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_toml_frontmatter = 1
vim.g.vim_markdown_json_frontmatter = 1

-- [[ Latex ]]
vim.g.tex_conceal = ''
vim.g.livepreview_previewer = 'zathura'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
