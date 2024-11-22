-- Keymap Helper Function
 function Map(mode, lhs, rhs, description, opts)
     local options = { noremap = true, silent = true, desc = description}
    if opts then
         options = vim.tbl_extend("force", options, opts)
     end
     vim.keymap.set(mode, lhs, rhs, options)
 end

vim.g.mapleader = " "

-- Window Movement
Map("n", "<leader>wh", "<C-w>h", "Left window")
Map("n", "<leader>wj", "<C-w>j", "Down Window")



vim.g.mapleader = " "

-- Window Movement
Map("n", "<leader>w", "", "Window")

Map("n", "<leader>wh", "<C-w>h", "Left window")
Map("n", "<leader>wj", "<C-w>j", "Down Window")
Map("n", "<leader>wk", "<C-w>k", "Above window")
Map("n", "<leader>wl", "<C-w>l", "Right Window")
Map("n", "<leader>ww", "<C-w>w", "Cycle Window")
Map("n", "<leader>wq", ":q", "Quit Window")

Map("t", "<leader>wh", "<cmd>wincmd h<CR>", "Left window")
Map("t", "<leader>wj", "<cmd>wincmd j<CR>", "Down Window")
Map("t", "<leader>wk", "<cmd>wincmd k<CR>", "Above window")
Map("t", "<leader>wl", "<cmd>wincmd l<CR>", "Right Window")
Map("t", "<leader>ww", "<cmd>wincmd w<CR>", "Cycle Window")
Map("n", "<leader>wq", "<cmd>q<CR>", "Quit Window")

-- Window Resizing
Map("n", "<leader>w<Up>", ":resize -2<CR>", "Window size down")
Map("n", "<leader>w<Down>", ":resize +2<CR>", "Window size up")
Map("n", "<leader>w<Left>", ":vertical resize +2<CR>", "Window size left")
Map("n", "<leader>w<Right>", ":vertical resize -2<CR>", "Window size right")

Map("t", "<leader>w<Up>", "<cmd>resize -2<CR>", "Window size down")
Map("t", "<leader>w<Down>", "<cmd>resize +2<CR>", "Window size up")
Map("t", "<leader>w<Left>", "<cmd>vertical resize +2<CR>", "Window size left")
Map("t", "<leader>w<Right>", "<cmd>vertical resize -2<CR>", "Window size right")

-- Window splitting
Map("n", "<leader>w2", ":vsplit<CR><C-w>w", "Split Vertically")
Map("n", "<leader>w3", ":hsplit<CR><C-w>w", "Split Horizontally")

Map("n", "<leader>w2", "<cmd>vsplit<CR><C-w>w", "Split Vertically")
Map("n", "<leader>w3", "<cmd>hsplit<CR><C-w>w", "Split Horizontally")

-- Buffer switching
Map("n", "<leader>b", "", "Buffer")
Map("n", "<leader>bn", ":bn<CR>", "Next buffer")
Map("n", "<leader>bp", ":bp<CR>", "Previous buffer")
Map("n", "<leader>bk", ":bd<CR>", "Previous buffer")

-- Save
Map("n", "<leader>bs", ":w<CR>", "Save buffer")
Map("n", "<leader>s", ":w<CR>", "Save buffer")

-- Quit
Map("n", "<leader>q", "", "Quit")
Map("n", "<leader>qq", ":q<CR>", "Quit")
Map("n", "<leader>qq", ":wq<CR>", "Write and Quit")
Map("n", "<leader>qQ", ":q!<CR>", "Force Quit")

-- Undo-tree
Map("n", "<leader>ut", ":UndotreeToggle<CR>:UndotreeFocus<CR>", "Quit")

-- Telescope

local builtin = require('telescope.builtin')
-- Map("n", "<leader>ff", builtin.find_files, "Find Files")
Map("n", "<leader>f", "", "Files")
Map("n", "<leader>ff", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "Find Files")
Map("n", "<leader>fe", ":Telescope file_browser<CR>", "File Explorer")
Map("n", "<leader>.", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "Find Files")
Map("n", "<leader>/", builtin.live_grep,"Live Grep")
Map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
Map("n", "<leader>fb", builtin.buffers, "Find Buffers")
Map("n", "<leader>fg", builtin.live_grep, "Telescope Live Grep")
Map("n", "<leader>fr", builtin.oldfiles,"Recent Files")
-- Map("n", "<leader>fc", "<cmd> Telescope colorschemes <CR>", "Colourschemes")

-- Config
Map("n", "<leader>fc", ":Telescope file_browser path=~/.config/nvim select_buffer=true<CR>", "Open Config Directory")

