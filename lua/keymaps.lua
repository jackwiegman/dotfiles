-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }) -- TIP: Disable arrow keys in normal mode vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>') vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- -- [[ Telekasten Mappings]]
-- -- Launch panel if nothing is typed after <leader>z
-- vim.keymap.set('n', '<leader>z', '<cmd>Telekasten panel<CR>')
--
-- -- Most used functions
-- vim.keymap.set('n', '<leader>zf', '<cmd>Telekasten find_notes<CR>')
-- vim.keymap.set('n', '<leader>zg', '<cmd>Telekasten search_notes<CR>')
-- vim.keymap.set('n', '<leader>zd', '<cmd>Telekasten goto_today<CR>')
-- vim.keymap.set('n', '<leader>zz', '<cmd>Telekasten follow_link<CR>')
-- vim.keymap.set('n', '<leader>zn', '<cmd>Telekasten new_note<CR>')
-- vim.keymap.set('n', '<leader>zc', '<cmd>Telekasten show_calendar<CR>')
-- vim.keymap.set('n', '<leader>zb', '<cmd>Telekasten show_backlinks<CR>')
-- vim.keymap.set('n', '<leader>zI', '<cmd>Telekasten insert_img_link<CR>')
--
-- -- Call insert link automatically when we start typing a link
-- vim.keymap.set('i', '[[', '<cmd>Telekasten insert_link<CR>')
