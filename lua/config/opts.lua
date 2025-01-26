vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.clipboard = 'unnamedplus'

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]

vim.g.have_nerd_font = false

--Line numbers
vim.wo.number = true
vim.opt.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Enable auto reload if file changes

vim.opt.autoread = true

-- auto commands to update buffer and notify user of update
-- vim.api.nvim_create_autocmd(
--   { 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, -- Events
--   {
--     pattern = '*', -- Match all files
--     callback = function()
--       if vim.api.nvim_get_mode().mode ~= 'c' then -- Check if the mode is not 'command-line'
--         vim.cmd 'checktime' -- Update buffer if the file changed outside
--       end
--     end,
--   }
-- )
--
-- vim.api.nvim_create_autocmd('FileChangedShellPost', {
--   pattern = '*',
--   callback = function()
--     vim.api.nvim_echo({ { 'File changed on disk. Buffer reloaded.', 'WarningMsg' } }, false, {})
--   end,
-- })

-- Reload buffer on focus-related events
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  callback = function()
    if vim.api.nvim_get_mode().mode ~= 'c' then
      vim.cmd 'checktime'
    end
  end,
})

-- Set up a periodic timer to check for file changes even when terminal focus is lost
local timer = vim.loop.new_timer()
timer:start(
  0,
  1000,
  vim.schedule_wrap(function() -- Runs every 5 seconds
    vim.cmd 'checktime'
  end)
)

-- Notify when the buffer is reloaded due to external changes
vim.api.nvim_create_autocmd('FileChangedShellPost', {
  pattern = '*',
  callback = function()
    vim.api.nvim_echo({ { 'File changed on disk. Buffer reloaded.', 'WarningMsg' } }, false, {})
  end,
})
