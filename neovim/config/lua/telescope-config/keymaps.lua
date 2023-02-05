-- [[ Telescope keymaps ]]
-- [[ Aliases ]]
local keymap = vim.keymap.set

-- [[ Keymaps ]]
-- Start telescope
keymap('n', '<a-f>', [[:Telescope find_files<cr>]], {noremap = true})
-- See `:help telescope.builtin`
keymap('n', '<leader>?', require('telescope.builtin').oldfiles, {
  desc = 'Find recently opened files'
})
keymap('n', '<leader><space>', require('telescope.builtin').buffers, {
  desc = 'Find existing buffers'
})
keymap('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(
    require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false
    })
end, { desc = 'Fuzzily search in current buffer' })
keymap('n', '<leader>sf', require('telescope.builtin').find_files, {
  desc = 'Search files'
})
keymap('n', '<leader>sh', require('telescope.builtin').help_tags, {
  desc = 'Search help'
})
keymap('n', '<leader>sw', require('telescope.builtin').grep_string, {
  desc = 'Search current word'
})
keymap('n', '<leader>sg', require('telescope.builtin').live_grep, {
  desc = 'Search by grep'
})
keymap('n', '<leader>sd', require('telescope.builtin').diagnostics, {
  desc = 'Search diagnostics'
})


-- vim: ts=2 sts=2 sw=2 et
