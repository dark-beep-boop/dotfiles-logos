-- [[ neo-tree.nvim ]]

return {
  {
    -- File tree
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    keys = {
      {
        '<leader>n',
        [[:Neotree toggle<cr>]],
        noremap = true,
        desc = 'Toggle NvimTree',
      },
      {
        '<leader>n',
        [[:Neotree toggle<cr>]],
        't',
        noremap = true,
        desc = 'Toggle Neotree',
      },
    },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      require('neo-tree').setup {
        default_component_configs = {
          container = {
            enable_character_fade = true
          },
          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = '┊',
            last_indent_marker = '└',
            highlight = 'NeoTreeIndentMarker',
            with_expanders = nil,
            expander_collapsed = '',
            expander_expanded = '',
            expander_highlight = 'NeoTreeExpander',
          },
          icon = {
            folder_closed = '',
            folder_open = '',
            folder_empty = '',
            default = '*',
            highlight = 'NeoTreeFileIcon'
          },
          modified = {
            symbol = '[+]',
            highlight = 'NeoTreeModified',
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = 'NeoTreeFileName',
          },
          git_status = {
            symbols = {
              added     = '✚',
              modified  = '',
              deleted   = '✖',
              renamed   = '',
              untracked = '',
              ignored   = '',
              unstaged  = '󰇘',
              staged    = '',
              conflict  = '',
            }
          },
        },
        window = {
          position = 'left',
          width = 30,
        },
      }
    end,
  }
}

-- vim: ts=2 sts=2 sw=2 et
