-- [[ Neovim plugins ]]
-- [[ Package manager ]]
-- Install packer
local install_path = vim.fn.stdpath 'data' ..
  '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system {
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim', install_path
  }
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- [[ Packages ]]
  -- Fast plugin load
  use 'lewis6991/impatient.nvim'

  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Start page
  use 'mhinz/vim-startify'

  -- Color theme
  use 'dark-beep-boop/base16-nvim'

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = require 'lualine-config'
  }

  -- Keymap finder
  use { 'folke/which-key.nvim', config = require('which-key-config') }

  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    tag = 'nightly',
    config = require 'nvim-tree-config'
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = 'nvim-lua/plenary.nvim',
    config = require 'telescope-config'
  }

  -- Fuzzy finder algorithm
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable 'make' == 1
  }

  -- ctag code information
  use { 'preservim/tagbar', config = require 'tagbar-config' }

  -- Git management
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
  use { 'lewis6991/gitsigns.nvim', config = require 'gitsigns-config' }

  -- Indentation lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = require 'indent-blankline-config'
  }

  -- Comment visual regions and lines
  use {
    'numToStr/Comment.nvim',
    config = require 'comment-config'
  }

  -- Detect tabstop and shiftwidth automatically
  use 'tpope/vim-sleuth'

  -- Automatically match symbol pairs
  use { 'windwp/nvim-autopairs', config = require 'autopairs-config' }

  -- Terminal
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = require 'toggleterm-config'
  }

  -- Highlight, edit, and navigate code
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    config = require 'nvim-treesitter-config'
  }

  -- Additional text objects via treesitter
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter'
  }

  -- Language Server Protocol
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically instal LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
      -- Additional lua confiiguration
      'folke/neodev.nvim'
    },
    config = require 'lspconfig-config'
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'honza/vim-snippets'
    },
    config = require 'nvim-cmp-config'
  }

  -- Preview markdown docs
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }

  -- Preview latex docs
  use 'xuhdev/vim-latex-live-preview'

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  -- Install new packages on init
  require('packer').install()
end)

-- vim: ts=2 sts=2 sw=2 et
