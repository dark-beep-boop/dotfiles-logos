-- [[ Telescope configuration ]]
-- [[ Modules ]]
require 'telescope-config.keymaps'

-- [[ Setup ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<c-u>'] = false,
        ['<c-d>'] = false
      }
    }
  }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- vim: ts=2 sts=2 sw=2 et
