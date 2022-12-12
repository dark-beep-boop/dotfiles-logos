-- [[ Plugins.lua ]]
-- Use Packer as package manager
return require('packer').startup(
  function(use)
    -- [[ Appearance ]]
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = require('tree-config')
    }
    use 'mhinz/vim-startify'
    use {
      'nvim-lualine/lualine.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        opt = true
      },
      config = require('lualine-config')
    }
    use 'dark-beep-boop/base16-nvim'

    -- [[ Utilities ]]
    use {
      'folke/which-key.nvim',
      config = function()
        require('which-key').setup {}
      end
    }

    -- [[ Development ]]
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'majutsushi/tagbar'
    use 'Yggdroot/indentLine'
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'
    use {
      'windwp/nvim-autopairs',
      config = require('autopairs-config')
    }
    use 'voldikss/vim-floaterm'
    use 'lewis6991/impatient.nvim'
    use 'sheerun/vim-polyglot'
    use 'dense-analysis/ale'
    use {
      'neoclide/coc.nvim',
      branch = 'release',
      config = require('coc-config')
    }
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({
          with_sync = true
        })
        ts_update()
      end,
      config = require('treesitter-config')
    }
    use {
      'jbyuki/instant.nvim',
      config = require('instant-config')
    }
    use 'honza/vim-snippets'

    -- [[ Debugging ]]
    use {
      'mfussenegger/nvim-dap',
      config = require('dap-config')
    }
    use {
      'mfussenegger/nvim-dap-python',
      requires = { 'mfussenegger/nvim-dap' }
    }
    use {
      'rcarriga/nvim-dap-ui',
      requires = { 'mfussenegger/nvim-dap' },
      config = require('dap-ui-config')
    }
    use {
      'theHamsta/nvim-dap-virtual-text',
      config = require('dap-virtual-text-config')
    }
    use {
      'nvim-neotest/neotest',
      requires = {
        'nvim-neotest/neotest-python',
        'nvim-neotest/neotest-plenary',
        'nvim-neotest/neotest-vim-test',
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'antoinemadec/FixCursorHold.nvim'
      },
      config = require('neotest-config')
    }
  end)
