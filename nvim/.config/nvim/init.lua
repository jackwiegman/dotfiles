-- Config w/ no mason and just java
-- Map space to leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- True if nerd font installed in terminal
-- User set, checks for icons
vim.g.have_nerd_font = true

-- require('config')
-- require('core')

-- [[ OPTIONS CONFIGURATION ]]

-- [[ Theme & Transparency ]]
-- vim.cmd.colorscheme("unokai")
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- [[ Basic settings ]]
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.o.cursorline = true -- Highlight current line
vim.o.wrap = false -- Don't wrap lines
vim.o.scrolloff = 8 -- Lines between edge of screen
vim.o.sidescrolloff = 5 -- Side scrollof
-- vim.o.textwidth = 100
-- vim.o.colorcolumn = '100' -- Show column at 100 characters
vim.cmd('let g:netrw_liststyle=3') -- Default file viewer to tree style

-- [[ Indentation ]]
-- vim.o.tabstop = 4  -- Default 8                          -- Tab width (prolly don't change)
vim.o.softtabstop = 4 -- Soft tab stop
vim.o.shiftwidth = 4 -- Indent width
vim.o.expandtab = true -- Use spaces instead of tabs
-- vim.o.smartindent = true -- Smart auto-indenting (might be messing up with 2 space tab lua files)
-- vim.o.autoindent = true -- Copy indent from current line

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
vim.o.matchtime = 2 -- How long to show matching bracket
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
-- vim.opt.iskeyword:append('-') -- Treat dash as part of word
-- vim.opt.path:append('**') -- include subdirectories in search
vim.o.selection = 'exclusive' -- Selection behavior
vim.o.mouse = 'a' -- Enable mouse support
vim.o.modifiable = true -- Allow buffer modifications
vim.o.encoding = 'UTF-8' -- Set encoding

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
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
--
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

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- Pulls up quickfix list
vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ END KEYMAPS ]]

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ END Autocommands ]]

-- [[ Lazy Setup ]]

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out =
    vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Plugin installation]]
require('lazy').setup({
  spec = {

    -- require('plugins.colorscheme')

    -- Import plugins here
    { import = 'plugins' },

    {
      'danymat/neogen',
      config = true,
      opts = {
        snippet_engine = 'luasnip',
      },
    },

    { -- indent-blankline config
      'lukas-reineke/indent-blankline.nvim',
      -- Enable `lukas-reineke/indent-blankline.nvim`
      -- See `:help ibl`
      main = 'ibl',
      opts = {},
    },

    { -- autopairs config
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      opts = {},
    },

    -- Highlight todo, notes, etc in comments
    { -- todo comments block
      'folke/todo-comments.nvim',
      event = 'VimEnter',
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = {
        signs = false,
      },
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'gruvbox' } },
  -- automatically check for plugin updates
  checker = { enabled = true },

  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
