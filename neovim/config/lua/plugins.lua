-- [[ Plugins.lua ]]
-- Use Packer as package manager
return require('packer').startup(
  function(use)
    -- [[ Appearance ]]
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'mhinz/vim-startify'
    use {
      'nvim-lualine/lualine.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        opt = true
      }
    }
    use 'dark-beep-boop/base16-nvim'

    -- [[ Utilities ]]
    use {
      'folke/which-key.nvim',
      config = function()
        require("which-key").setup {}
      end
    }

    -- [[ Development ]]
    use {
      'nvim-telescope/telescope.nvim',
      requires = {'nvim-lua/plenary.nvim'}
    }
    use 'majutsushi/tagbar'
    use 'Yggdroot/indentLine'
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'
    use 'windwp/nvim-autopairs'
    use 'voldikss/vim-floaterm'
    use 'lewis6991/impatient.nvim'
    use 'sheerun/vim-polyglot'
    use 'dense-analysis/ale'
    use {'neoclide/coc.nvim', branch = 'release'}
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({
          with_sync = true
        })
        ts_update()
      end,
    }

    -- [[ Debugging ]]
    use 'mfussenegger/nvim-dap'
    use {'mfussenegger/nvim-dap-python', requires = {'mfussenegger/nvim-dap'}}
    use {'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'}}
    use 'theHamsta/nvim-dap-virtual-text'
    use {
      'nvim-neotest/neotest',
      requires = {
        'nvim-neotest/neotest-python',
        'nvim-neotest/neotest-plenary',
        'nvim-neotest/neotest-vim-test',
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'antoinemadec/FixCursorHold.nvim'
      }
    }
  end)
