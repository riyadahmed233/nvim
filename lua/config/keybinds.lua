-- Keymap Helper Function
function Map(mode, lhs, rhs, description, opts)
  local options = { noremap = true, silent = true, desc = description }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Window Movement
Map('n', '<leader>wh', '<C-w>h', 'Left window')
Map('n', '<leader>wj', '<C-w>j', 'Down Window')

vim.g.mapleader = ' '

-- Window Movement
Map('n', '<leader>w', '', 'Window')

Map('n', '<C-h>', '<C-w>h', 'Left window')
Map('n', '<C-j>', '<C-w>j', 'Down Window')
Map('n', '<C-k>', '<C-w>k', 'Above window')
Map('n', '<C-l>', '<C-w>l', 'Right Window')
Map('n', '<leader>ww', '<C-w>w', 'Cycle Window')
Map('n', '<leader>wq', ':q', 'Quit Window')

Map('t', '<C-h>', '<cmd>wincmd h<CR>', 'Left window')
Map('t', '<C-j>', '<cmd>wincmd j<CR>', 'Down Window')
Map('t', '<C-k>', '<cmd>wincmd k<CR>', 'Above window')
Map('t', '<C-l>', '<cmd>wincmd l<CR>', 'Right Window')
Map('t', '<leader>ww', '<cmd>wincmd w<CR>', 'Cycle Window')
Map('n', '<leader>wq', '<cmd>q<CR>', 'Quit Window')

-- Window Resizing
Map('n', '<leader>w<Up>', ':resize -2<CR>', 'Window size down')
Map('n', '<leader>w<Down>', ':resize +2<CR>', 'Window size up')
Map('n', '<leader>w<Left>', ':vertical resize +2<CR>', 'Window size left')
Map('n', '<leader>w<Right>', ':vertical resize -2<CR>', 'Window size right')

Map('t', '<leader>w<Up>', '<cmd>resize -2<CR>', 'Window size down')
Map('t', '<leader>w<Down>', '<cmd>resize +2<CR>', 'Window size up')
Map('t', '<leader>w<Left>', '<cmd>vertical resize +2<CR>', 'Window size left')
Map('t', '<leader>w<Right>', '<cmd>vertical resize -2<CR>', 'Window size right')

-- Window splitting
-- Map('n', '<leader>w2', ':vsplit<CR><C-w>w<CR>', 'Split Vertically')
-- Map('n', '<leader>w3', ':split<CR><C-w>w<CR>', 'Split Horizontally')
--
-- Map('n', '<leader>w2', '<cmd>vsplit<CR><C-w>w<CR>', 'Split Vertically')
-- Map('n', '<leader>w3', '<cmd>split<CR><C-w>w<CR>', 'Split Horizontally')

Map('n', '<leader>w2', ':vsplit<CR>', 'Split Vertically')
Map('n', '<leader>w3', ':split<CR>', 'Split Horizontally')

Map('n', '<leader>w2', '<cmd>vsplit<CR>', 'Split Vertically')
Map('n', '<leader>w3', '<cmd>split<CR>', 'Split Horizontally')

-- Tabs

Map('t', '<leader>t2', ':tabnew', 'New Tab')
Map('t', '<leader>t3', ':tabnew', 'New Tab')
Map('t', '<leader>tq', ':tabclose', 'Close Tab')
Map('t', '<leader>tt', ':+tabnext', 'Next Tab')
Map('t', '<leader>tj', ':+tabnext', 'Next Tab')
Map('t', '<leader>tk', ':-tabnext', 'Previous Tab')
Map('t', '<leader>th', ':-tabmove', 'Move Tab Left')
Map('t', '<leader>tl', ':+tabmove', 'Move Tab Right')

-- Buffer switching
Map('n', '<leader>b', '', 'Buffer')
Map('n', '<leader>bn', ':bn<CR>', 'Next buffer')
Map('n', '<leader>bp', ':bp<CR>', 'Previous buffer')
Map('n', '<leader>bk', ':bd<CR>', 'Previous buffer')

-- Save
Map('n', '<leader>bs', ':w<CR>', 'Save buffer')
Map('n', '<leader>s', ':w<CR>', 'Save buffer')

-- Quit
Map('n', '<leader>q', '', 'Quit')
Map('n', '<leader>qq', ':q<CR>', 'Quit')
Map('n', '<leader>qq', ':wq<CR>', 'Write and Quit')
Map('n', '<leader>qQ', ':q!<CR>', 'Force Quit')

-- Undo-tree
Map('n', '<leader>tu', ':UndotreeToggle<CR>:UndotreeFocus<CR>', 'Toggle Undotree')
Map('n', '<leader>tn', ':Neotree toggle<CR>', 'Toggle Neotree')

-- Telescope

local builtin = require 'telescope.builtin'

-- Map("n", "<leader>ff", builtin.find_files, "Find Files")
Map('n', '<leader>f', '', 'Files')
Map('n', '<leader>ff', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', 'Find Files')
Map('n', '<leader>fe', ':Telescope file_browser<CR>', 'File Explorer')
Map('n', '<leader>.', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', 'Find Files')
-- Map("n", "<leader>/", builtin.live_grep,"Live Grep")
Map('n', '<leader>fa', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>')
Map('n', '<leader>fb', builtin.buffers, 'Find Buffers')
Map('n', '<leader>fg', '<cmd> Telescope current_buffer_fuzzy_find <CR>', 'Telescope Live Grep')
Map('n', '<leader>fr', builtin.oldfiles, 'Recent Files')
-- Map("n", "<leader>fc", "<cmd> Telescope colorschemes <CR>", "Colourschemes")

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Config
Map('n', '<leader>fc', ':Telescope file_browser path=~/.config/nvim select_buffer=true<CR>', 'Open Config Directory')
Map('n', '<leader>fp', ':Telescope file_browser path=~/Documents/git select_buffer=true<CR>', 'Open Projects Directory')

-- Kickstart.nvim

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
