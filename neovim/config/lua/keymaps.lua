-- [[ keybindings.lua ]]
local keymap = vim.keymap.set

-- [[ Movement ]]
-- Move lines
keymap('i', '<a-j>', [[<esc>:m .+1<cr>==gi]], {noremap = true})
keymap('i', '<a-k>', [[<esc>:m .-2<cr>==gi]], {noremap = true})
keymap('v', '<a-j>', [[:m '>+1<cr>gv=gv]], {noremap = true})
keymap('v', '<a-k>', [[:m '<-2<cr>gv=gv]], {noremap = true})

-- Move split panes
keymap('n', '<a-h>', [[<c-w>H]], {noremap = true})
keymap('n', '<a-j>', [[<c-w>J]], {noremap = true})
keymap('n', '<a-k>', [[<c-w>K]], {noremap = true})
keymap('n', '<a-l>', [[<c-w>L]], {noremap = true})
keymap('n', '<m-left>', [[<c-w>H]], {noremap = true})
keymap('n', '<m-down>', [[<c-w>J]], {noremap = true})
keymap('n', '<m-up>', [[<c-w>K]], {noremap = true})
keymap('n', '<m-right>', [[<c-w>L]], {noremap = true})

-- Move between split panes 
keymap('n', '<c-h>', [[<c-w>h]], {noremap = true})
keymap('n', '<c-j>', [[<c-w>j]], {noremap = true})
keymap('n', '<c-k>', [[<c-w>k]], {noremap = true})
keymap('n', '<c-l>', [[<c-w>l]], {noremap = true})
keymap('n', '<c-left>', [[<c-w>h]], {noremap = true})
keymap('n', '<c-down>', [[<c-w>j]], {noremap = true})
keymap('n', '<c-up>', [[<c-w>k]], {noremap = true})
keymap('n', '<c-right>', [[<c-w>l]], {noremap = true})

-- Change split pane size
keymap('n', '<c-m-h>', [[:vertical resize -1.5<cr>]], {noremap = true})
keymap('n', '<c-m-j>', [[:horizontal resize -1.5<cr>]], {noremap = true})
keymap('n', '<c-m-k>', [[:horizontal resize +1.5<cr>]], {noremap = true})
keymap('n', '<c-m-l>', [[:vertical resize +1.5<cr>]], {noremap = true})
keymap('n', '<c-m-left>', [[:vertical resize -1.5<cr>]], {noremap = true})
keymap('n', '<c-m-down>', [[:horizontal resize -1.5<cr>]], {noremap = true})
keymap('n', '<c-m-up>', [[:horizontal resize +1.5<cr>]], {noremap = true})
keymap('n', '<c-m-right>', [[:vertical resize +1.5<cr>]], {noremap = true})

-- [[ Diagnostic ]]
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>e', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)

-- [[ nvim-tree ]]
-- Toggle nvim-tree
keymap('n', '<c-n>', [[:NvimTreeToggle<cr>]], {noremap = true})

-- [[ indentLine ]]
-- Toggle indent lines
keymap('n', '<c-m-i>', [[:IndentLinesToggle<cr>]], {noremap = true})

-- [[ tagbar ]]
-- Toggle tagbar
keymap('n', '<c-s>', [[:TagbarToggle<cr>]], {noremap = true})

-- [[ telescope ]]
-- Start telescope
keymap('n', '<a-f>', [[:Telescope find_files<cr>]], {noremap = true})
-- See `:help telescope.builtin`
keymap('n', '<leader>?', require('telescope.builtin').oldfiles, {
  desc = '[?] Find recently opened files'
})
keymap('n', '<leader><space>', require('telescope.builtin').buffers, {
  desc = '[ ] Find existing buffers'
})
keymap('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme,
  -- layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(
    require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

keymap('n', '<leader>sf', require('telescope.builtin').find_files, {
  desc = '[S]earch [F]iles'
})
keymap('n', '<leader>sh', require('telescope.builtin').help_tags, {
  desc = '[S]earch [H]elp'
})
keymap('n', '<leader>sw', require('telescope.builtin').grep_string, {
  desc = '[S]earch current [W]ord'
})
keymap('n', '<leader>sg', require('telescope.builtin').live_grep, {
  desc = '[S]earch by [G]rep'
})
keymap('n', '<leader>sd', require('telescope.builtin').diagnostics, {
  desc = '[S]earch [D]iagnostics'
})

-- [[ floaterm ]]
-- Normal mode
keymap('n', '<leader>t<space>', [[:FloatermNew<cr>]], {noremap = true})
keymap('n', '<leader>tp', [[:FloatermPrev<cr>]], {noremap = true})
keymap('n', '<leader>tn', [[:FloatermNext<cr>]], {noremap = true})
keymap('n', '<leader>tt', [[:FloatermToggle<cr>]], {noremap = true})
keymap('n', '<esc>', [[:FloatermHide<cr>]], {noremap = true})
keymap('n', '<leader>tk', [[:FloatermKill<cr>]], {noremap = true})

-- Terminal mode
keymap('t', '<esc>', [[<c-\><c-n>]], {noremap = true})
keymap('t', '<leader>tf', [[<c-\><c-n>:FloatermNew<cr>]], {noremap = true})
keymap('t', '<leader>tp', [[<c-\><c-n>:FloatermPrev<cr>]], {noremap = true})
keymap('t', '<leader>tn', [[<c-\><c-n>:FloatermNext<cr>]], {noremap = true})
keymap('t', '<leader>tt', [[<c-\><c-n>:FloatermToggle<cr>]], {noremap = true})
keymap('t', '<leader>tk', [[<c-\><c-n>:FloatermKill<cr>]], {noremap = true})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
