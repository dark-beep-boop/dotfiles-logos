-- [[ Plugins.lua ]]
-- Use Packer as package manager
return require('packer').startup(
  function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- [[ Appearance ]]
    -- Start page
    use 'mhinz/vim-startify'
    -- Status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = {
        'nvim-tree/nvim-web-devicons',
        opt = true
      },
      config = require('lualine-config')
    }
    -- Colortheme for base16 themes
    use 'dark-beep-boop/base16-nvim'

    -- [[ Utilities ]]
    -- Fast plugin load
    use 'lewis6991/impatient.nvim'
    -- File explorer
    use {
      'nvim-tree/nvim-tree.lua',
      requires = 'nvim-tree/nvim-web-devicons',
      tag = 'nightly',
      config = require('nvim-tree-config')
    }
    -- Keybinding finder
    use {
      'folke/which-key.nvim',
      config = require('which-key-config')
    }
    -- Fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      requires = 'nvim-lua/plenary.nvim',
      config = require('telescope-config')
    }
    -- Fuzzy finder algorithm
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
      cond = vim.fn.executable 'make' == 1
    }

    -- [[ Development ]]
    -- ctag code information
    use 'majutsushi/tagbar'
    -- Git management
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use {
      'lewis6991/gitsigns.nvim',
      config = require('gitsigns-config')
    }
    use 'junegunn/gv.vim'
    -- Add indentation guides
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = require('indent-blankline-config')
    }
    -- Comment visual regions and lines
    use {
      'numToStr/Comment.nvim',
      config = require('comment-config')
    }
    -- Detect tabstop and shiftwidth automatically
    use 'tpope/vim-sleuth'
    -- Automatically match symbol pairs
    use {
      'windwp/nvim-autopairs',
      config = require('autopairs-config')
    }
    -- Floating terminals
    use 'voldikss/vim-floaterm'
    -- Highlight, edit, and navigate code
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
      end,
      config = require('treesitter-config')
    }
    -- Additional text objects via treesitter
    use {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter'
    }
    -- Code snippets
    use 'honza/vim-snippets'
    -- Preview markdown docs
    use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install'
    }
    -- Preview latex docs
    use 'xuhdev/vim-latex-live-preview'
    -- LSP configuration & plugins
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
      config = require('nvim-lspconfig-config')
    }
    use {
      'folke/neodev.nvim',
      config = require('neodev-config')
    }

    -- Autocompletion
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
      },
      config = require('nvim-cmp-config')
    }
  end)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
