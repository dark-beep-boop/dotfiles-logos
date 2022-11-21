-- Use Packer as package manager
return require("packer").startup(function(use)
    use { "wincent/base16-nvim" }
    use {
      "kyazdani42/nvim-tree.lua", 
      requires = "kyazdani42/nvim-web-devicons"
    }
    use { "mhinz/vim-startify" }
    use { "DanilaMihailov/beacon.nvim" }
    use {
      "nvim-lualine/lualine.nvim", 
      requires = {
        "kyazdani42/nvim-web-devicons",
        opt = true
      }
    }
  end)
