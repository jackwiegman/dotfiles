-- [[ Setting options ]]
-- ---------------------
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Default file viewer to tree style
vim.cmd('let g:netrw_liststyle=3')

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.cursorline = true
vim.opt.cursorlineopt = 'line' -- line,number,

-- Enable break indent (indent wrapped lines)
vim.opt.breakindent = true

-- Indent & tabs
vim.opt.softtabstop = 4 -- spaces tab uses while editing feels like 4 but actual tab is still 8,
-- keeps tabstop at default just in case something uses it
-- we'll see how it goes
vim.opt.tabstop = 8 -- how many columns a tab char is worth
vim.opt.expandtab = true -- expandtab to spaces when pressing tab key
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.shiftwidth = 4 -- number of spaces to use for (auto)indention levels
-- vim.opt.shiftround = true -- Round indentation to multiple of shiftwidth when shifting lines
-- vim.opt.smartindent =  -- true -- smart autoindenting for C programs

vim.opt.textwidth = 100
vim.opt.colorcolumn = '100'

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
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
vim.opt.sidescrolloff = 5

-- Autom. read file when changed outside of Vim
vim.opt.autoread = true

-- Mini.basics options
-- in plugins.mini module
-- require('mini.basics').setup()

-- General
-- o.undofile    = true  -- Enable persistent undo (see also `:h undodir`)

-- o.backup      = false -- Don't store backup while overwriting the file
-- o.writebackup = false -- Don't store backup while overwriting the file

-- o.mouse       = 'a'   -- Enable mouse for all available modes

-- vim.cmd('filetype plugin indent on') -- Enable all filetype plugins
-- sets leader to <space>
-- backup - false: Don't store backup wile overwriting the file
-- writebackup - false: create backup during write
-- mouse - allow mouse use for all modes
-- undofile - true: persistent undo (:h undodir)
--
-- [[ Appearance ]]
-- breakindent - true: indent wrapped lines to match start
-- cursorline - true: highlight current line
-- o.linebreak     = true    -- Wrap long lines at 'breakat' (if 'wrap' is set)
-- o.number        = true    -- Show line numbers
-- o.splitbelow    = true    -- Horizontal splits will be below
-- o.splitright    = true    -- Vertical splits will be to the right

-- o.ruler         = false   -- Don't show cursor position in command line
-- o.showmode      = false   -- Don't show mode in command line
-- o.wrap          = false   -- Display long lines as just one line

-- o.signcolumn    = 'yes'   -- Always show sign column (otherwise it will shift text)
-- o.fillchars     = 'eob: ' -- Don't show `~` outside of buffer

-- -- Editing
-- o.ignorecase  = true -- Ignore case when searching (use `\C` to force not doing that)
-- o.incsearch   = true -- Show search results while typing
-- o.infercase   = true -- Infer letter cases for a richer built-in keyword completion
-- o.smartcase   = true -- Don't ignore case when searching if pattern has upper case
-- o.smartindent = true -- Make indenting smart

-- o.completeopt   = 'menuone,noselect' -- Customize completions
-- o.virtualedit   = 'block'            -- Allow going past the end of line in visual block mode
-- o.formatoptions = 'qjl1'             -- Don't autoformat comments
--                 = qjl1 tacn                     -- Default: tcqj
