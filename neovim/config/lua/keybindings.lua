-- [[ keybindings.lua ]]
local keymap = vim.keymap.set

-- [[ Movement ]]
-- Move lines
keymap('i', '<A-j>', [[<Esc>:m .+1<CR>==gi]], {noremap = true})
keymap('i', '<A-k>', [[<Esc>:m .-2<CR>==gi]], {noremap = true})
keymap('v', '<A-j>', [[:m '>+1<CR>gv=gv]], {noremap = true})
keymap('v', '<A-k>', [[:m '<-2<CR>gv=gv]], {noremap = true})

-- Move split panes
keymap('n', '<A-h>', [[<C-W>H]], {noremap = true})
keymap('n', '<A-j>', [[<C-W>J]], {noremap = true})
keymap('n', '<A-k>', [[<C-W>K]], {noremap = true})
keymap('n', '<A-l>', [[<C-W>L]], {noremap = true})
keymap('n', '<M-Left>', [[<C-W>H]], {noremap = true})
keymap('n', '<M-Down>', [[<C-W>J]], {noremap = true})
keymap('n', '<M-Up>', [[<C-W>K]], {noremap = true})
keymap('n', '<M-Right>', [[<C-W>L]], {noremap = true})

-- Move between split panes 
keymap('n', '<C-h>', [[<C-w>h]], {noremap = true})
keymap('n', '<C-j>', [[<C-w>j]], {noremap = true})
keymap('n', '<C-k>', [[<C-w>k]], {noremap = true})
keymap('n', '<C-l>', [[<C-w>l]], {noremap = true})
keymap('n', '<C-Left>', [[<C-w>h]], {noremap = true})
keymap('n', '<C-Down>', [[<C-w>j]], {noremap = true})
keymap('n', '<C-Up>', [[<C-w>k]], {noremap = true})
keymap('n', '<C-Right>', [[<C-w>l]], {noremap = true})

-- Change split pane size
keymap('n', '<C-M-h>', [[:vertical resize -1.5<CR>]], {noremap = true})
keymap('n', '<C-M-j>', [[:horizontal resize -1.5<CR>]], {noremap = true})
keymap('n', '<C-M-k>', [[:horizontal resize +1.5<CR>]], {noremap = true})
keymap('n', '<C-M-l>', [[:vertical resize +1.5<CR>]], {noremap = true})
keymap('n', '<C-M-Left>', [[:vertical resize -1.5<CR>]], {noremap = true})
keymap('n', '<C-M-Down>', [[:horizontal resize -1.5<CR>]], {noremap = true})
keymap('n', '<C-M-Up>', [[:horizontal resize +1.5<CR>]], {noremap = true})
keymap('n', '<C-M-Right>', [[:vertical resize +1.5<CR>]], {noremap = true})

-- [[ nvim-tree ]]
-- Toggle nvim-tree
keymap('n', '<C-n>', [[:NvimTreeToggle<CR>]], {noremap = true})

-- [[ indentLine ]]
-- Toggle indent lines
keymap('n', '<C-M-i>', [[:IndentLinesToggle<CR>]], {noremap = true})

-- [[ tagbar ]]
-- Toggle tagbar
keymap('n', '<C-s>', [[:TagbarToggle<CR>]], {noremap = true})

-- [[ telescope ]]
-- Start telescope
keymap('n', '<A-f>', [[:Telescope find_files<CR>]], {noremap = true})

-- [[ floaterm ]]
-- Normal mode
keymap('n', '<Leader>tf', [[:FloatermNew<CR>]], {noremap = true})
keymap('n', '<Leader>ts', [[:FloatermNew --height=0.2 --wintype=split<CR>]], {noremap = true})
keymap('n', '<Leader>tp', [[:FloatermPrev<CR>]], {noremap = true})
keymap('n', '<Leader>tn', [[:FloatermNext<CR>]], {noremap = true})
keymap('n', '<Leader>tt', [[:FloatermToggle<CR>]], {noremap = true})
keymap('n', '<Leader>tk', [[:FloatermKill<CR>]], {noremap = true})

-- Terminal mode
keymap('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})
keymap('t', '<Leader>tf', [[<C-\><C-n>:FloatermNew<CR>]], {noremap = true})
keymap('t', '<Leader>ts', [[<C-\><C-n>:FloatermNew --height=0.2 --wintype=split<CR>]], {noremap = true})
keymap('t', '<Leader>tp', [[<C-\><C-n>:FloatermPrev<CR>]], {noremap = true})
keymap('t', '<Leader>tn', [[<C-\><C-n>:FloatermNext<CR>]], {noremap = true})
keymap('t', '<Leader>tt', [[<C-\><C-n>:FloatermToggle<CR>]], {noremap = true})
keymap('t', '<Leader>tk', [[<C-\><C-n>:FloatermKill<CR>]], {noremap = true})

-- Move split terminal panes
keymap('t', '<A-h>', [[<C-\><C-n><C-W>H]], {noremap = true})
keymap('t', '<A-j>', [[<C-\><C-n><C-W>J]], {noremap = true})
keymap('t', '<A-k>', [[<C-\><C-n><C-W>K]], {noremap = true})
keymap('t', '<A-l>', [[<C-\><C-n><C-W>L]], {noremap = true})
keymap('t', '<M-Left>', [[<C-\><C-n><C-W>H]], {noremap = true})
keymap('t', '<M-Down>', [[<C-\><C-n><C-W>J]], {noremap = true})
keymap('t', '<M-Up>', [[<C-\><C-n><C-W>K]], {noremap = true})
keymap('t', '<M-Right>', [[<C-\><C-n><C-W>L]], {noremap = true})

-- Move between split terminal panes 
keymap('t', '<C-h>', [[<C-\><C-n><C-w>h]], {noremap = true})
keymap('t', '<C-j>', [[<C-\><C-n><C-w>j]], {noremap = true})
keymap('t', '<C-k>', [[<C-\><C-n><C-w>k]], {noremap = true})
keymap('t', '<C-l>', [[<C-\><C-n><C-w>l]], {noremap = true})
keymap('t', '<C-Left>', [[<C-\><C-n><C-w>h]], {noremap = true})
keymap('t', '<C-Down>', [[<C-\><C-n><C-w>j]], {noremap = true})
keymap('t', '<C-Up>', [[<C-\><C-n><C-w>k]], {noremap = true})
keymap('t', '<C-Right>', [[<C-\><C-n><C-w>l]], {noremap = true})

-- Change split terminal pane size
keymap('t', '<C-M-h>', [[<C-\><C-n>:vertical resize -1.5<CR>]], {noremap = true})
keymap('t', '<C-M-j>', [[<C-\><C-n>:horizontal resize -1.5<CR>]], {noremap = true})
keymap('t', '<C-M-k>', [[<C-\><C-n>:horizontal resize +1.5<CR>]], {noremap = true})
keymap('t', '<C-M-l>', [[<C-\><C-n>:vertical resize +1.5<CR>]], {noremap = true})
keymap('t', '<C-M-Left>', [[<C-\><C-n>:vertical resize -1.5<CR>]], {noremap = true})
keymap('t', '<C-M-Down>', [[<C-\><C-n>:horizontal resize -1.5<CR>]], {noremap = true})
keymap('t', '<C-M-Up>', [[<C-\><C-n>:horizontal resize +1.5<CR>]], {noremap = true})
keymap('t', '<C-M-Right>', [[<C-\><C-n>:vertical resize +1.5<CR>]], {noremap = true})

-- [[ CoC ]]

-- Auto complete
-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keymap("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keymap("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion.
keymap("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keymap("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation.
keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
keymap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keymap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keymap("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Use K to show documentation in preview window.
keymap("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Symbol renaming.
keymap("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code.
keymap("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keymap("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
keymap("x", "<leader>as", "<Plug>(coc-codeaction-selected)", opts)
keymap("n", "<leader>as", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for applying codeAction to the current buffer.
keymap("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)

-- Apply AutoFix to problem on the current line.
keymap("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Run the Code Lens action on the current line.
keymap("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
keymap("x", "if", "<Plug>(coc-funcobj-i)", opts)
keymap("o", "if", "<Plug>(coc-funcobj-i)", opts)
keymap("x", "af", "<Plug>(coc-funcobj-a)", opts)
keymap("o", "af", "<Plug>(coc-funcobj-a)", opts)
keymap("x", "ic", "<Plug>(coc-classobj-i)", opts)
keymap("o", "ic", "<Plug>(coc-classobj-i)", opts)
keymap("x", "ac", "<Plug>(coc-classobj-a)", opts)
keymap("o", "ac", "<Plug>(coc-classobj-a)", opts)

-- Remap <C-f> and <C-b> for scroll float windows/popups.
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
keymap("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keymap("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keymap("i", "<C-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keymap("i", "<C-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keymap("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keymap("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
keymap("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
keymap("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics.
keymap("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions.
keymap("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands.
keymap("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document.
keymap("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols.
keymap("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item.
keymap("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item.
keymap("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list.
keymap("n", "<space>p", ":<C-u>CocListResume<cr>", opts)
