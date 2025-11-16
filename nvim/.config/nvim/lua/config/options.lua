-- [[ Theme & Transparency ]]
-- vim.cmd.colorscheme("unokai")
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- [[ Basic settings ]]
-- vim.opt.number = true                             -- Line numbers
-- vim.opt.relativenumber = true                     -- Relative line numbers
vim.o.cursorline = true -- Highlight current line
vim.o.wrap = false -- Don't wrap lines
vim.o.scrolloff = 8 -- Lines between edge of screen
vim.o.sidescrolloff = 5 -- Side scrollof
vim.o.textwidth = 100
vim.o.colorcolumn = '100' -- Show column at 100 characters
-- Default file viewer to tree style
vim.cmd('let g:netrw_liststyle=3')

-- [[ Indentation ]]
-- vim.o.tabstop = 4                               -- Tab width
-- vim.o.shiftwidth = 4                            -- Indent width
-- vim.o.softtabstop = 4                           -- Soft tab stop
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.smartindent = true -- Smart auto-indenting
vim.o.autoindent = true -- Copy indent from current line

-- [[ Search settings ]]
vim.o.ignorecase = true -- Case insensitive search
vim.o.smartcase = true -- Case sensitive if uppercase in search
vim.o.hlsearch = false -- Don't highlight search results
vim.o.incsearch = true -- Show matches as you type
vim.o.inccommand = 'split' -- Preview substitutions live, as you type!

-- [[ Visual settings ]]
vim.o.termguicolors = true -- Enable 24-bit colors
vim.o.signcolumn = 'yes' -- Always show sign column
vim.o.showmatch = true -- Highlight matching brackets
vim.o.matchtime = 4 -- How long to show matching bracket
-- vim.opt.cmdheight = 1                             -- Command line height
vim.o.completeopt = 'menuone,noinsert,noselect' -- Completion options
vim.o.showmode = false -- Don't show mode in command line
-- vim.opt.pumheight = 10                            -- Popup menu height
-- vim.opt.pumblend = 10                             -- Popup menu transparency
-- vim.opt.winblend = 0                              -- Floating window transparency
-- vim.opt.conceallevel = 0                          -- Don't hide markup
-- vim.opt.concealcursor = ""                        -- Don't hide cursor line markup
-- vim.opt.lazyredraw = true                         -- Don't redraw during macros
vim.o.synmaxcol = 300 -- Syntax highlighting limit

-- [[ File handling ]]
-- vim.opt.backup = false                            -- Don't create backup files
-- vim.opt.writebackup = false                       -- Don't create backup before writing
-- vim.opt.swapfile = false                          -- Don't create swap files
vim.o.undofile = true -- Persistent undo
-- vim.opt.undodir = vim.fn.expand("~/.vim/undodir")  -- Undo directory
vim.o.updatetime = 250 -- Faster completion
vim.o.timeoutlen = 300 -- Key timeout duration
-- vim.opt.ttimeoutlen = 0                           -- Key code timeout
vim.o.autoread = true -- Auto reload files changed outside vim
vim.o.autowrite = false -- Don't auto save

-- [[ Behavior settings ]]
vim.o.hidden = true -- Allow hidden buffers
vim.o.errorbells = false -- No error bells
-- vim.opt.backspace = "indent,eol,start"            -- Better backspace behavior
vim.o.autochdir = false -- Don't auto change directory
vim.opt.iskeyword:append('-') -- Treat dash as part of word
vim.opt.path:append('**') -- include subdirectories in search
vim.o.selection = 'exclusive' -- Selection behavior
vim.o.mouse = 'a' -- Enable mouse support
vim.o.modifiable = true -- Allow buffer modifications
vim.o.encoding = 'UTF-8' -- Set encoding
vim.o.confirm = true -- Prompt dialouge instead of failing

--  Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- [[ Cursor settings ]]
-- vim.o.guicursor =
--   'n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

-- [TODO: Figure out fold
-- [[ Folding  settings ]]
-- vim.opt.foldmethod = "expr"                        -- Use expression for folding
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"    -- Use treesitter for folding
-- vim.opt.foldlevel = 99                             -- Start with all folds open

-- [[ Split Behavior ]]
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 8

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
