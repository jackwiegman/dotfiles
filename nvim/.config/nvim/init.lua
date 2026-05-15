---------------------------------------------------------------------------------------------------
--- [[ Important Settings ]] ----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

---------------------------------------------------------------------------------------------------
--- [[ Basic Settings ]] --------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

vim.o.number = true
vim.o.relativenumber = false
vim.o.cursorline = true

vim.o.scrolloff = 8
vim.o.sidescrolloff = 5

vim.o.wrap = false

vim.cmd('let g:netrw_liststyle=3')

-- [[ Indentation ]]
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- [[ Search settings ]]
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.inccommand = 'split'

-- [[ Visual settings ]]
vim.o.termguicolors = true
vim.o.signcolumn = 'yes'
vim.o.showmode = false
vim.o.showmatch = true
vim.o.textwidth = 80
vim.o.colorcolumn = '+1'

-- [[ File handling ]]
vim.o.undofile = true
vim.o.autoread = true

-- [[ Behavior Settings ]]
vim.o.updatetime = 200
vim.o.timeoutlen = 350
vim.opt.path:append('**')
vim.o.mouse = 'a'
vim.o.modifiable = true
vim.o.confirm = true

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- [[ Split Behavior ]]
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

---------------------------------------------------------------------------------------------------
--- [[ Basic Keymaps ]] ---------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  virtual_text = true,
  virtual_lines = false,
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float({
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      })
    end,
  },
})

vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

---------------------------------------------------------------------------------------------------
--- [[ Basic Autocommands ]] ----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-on-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('column-width', { clear = true }),
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.bo.textwidth = 100
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('two-space-indent', { clear = true }),
  pattern = {
    'lua',
    'markdown',
    'json',
    'jsonc',
    'toml',
    'xml',
    'tex',
    'yaml',
    'html',
    'css',
    'javascript',
    'typescript',
  },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
  end,
})

---------------------------------------------------------------------------------------------------
--- [[ Lazy Setup ]] ------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  })
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

require('lazy').setup({
  spec = {

    -------------------------------------------------------------------------------------------
    --- [[ Plugins folder ]] --------------------------------------------------------------------
    -------------------------------------------------------------------------------------------
    { import = 'plugins' },

    -------------------------------------------------------------------------------------------
    --- [[ Colorscheme ]] --------------------------------------------------------------------
    -------------------------------------------------------------------------------------------
    {
      'ellisonleao/gruvbox.nvim',
      priority = 1000,
      opts = {
        contrast = 'medium',
        dim_inactive = true,
      },
      init = function()
        vim.cmd.colorscheme('gruvbox')
        vim.o.background = 'dark'
      end,
    },

    -------------------------------------------------------------------------------------------
    --- [[ Which-key ]] ----------------------------------------------------------------------
    -------------------------------------------------------------------------------------------
    {
      'folke/which-key.nvim',
      event = 'VimEnter',
      opts = {
        delay = 0,
        icons = { mappings = vim.g.have_nerd_font },
        spec = {
          { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
          { '<leader>t', group = '[T]oggle' },
          { '<leader>x', group = 'Trouble [X]' },
          { '<leader>g', group = '[G]it' },
          { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        },
      },
    },

    -------------------------------------------------------------------------------------------
    --- [[ Autopairs ]] ----------------------------------------------------------------------
    -------------------------------------------------------------------------------------------
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      opts = {},
    },

    -------------------------------------------------------------------------------------------
    --- [[ Render Markdown ]] ----------------------------------------------------------------------
    -------------------------------------------------------------------------------------------
    {
      'MeanderingProgrammer/render-markdown.nvim',
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
    },

    { -- Neo-tree block
      'nvim-neo-tree/neo-tree.nvim',
      -- version = '*',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
      },
      -- lazy = false, -- neo-tree will lazily load itself with lazy.nvim
      keys = {
        { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
      },
      opts = {
        filesystem = {
          window = {
            mappings = {
              ['\\'] = 'close_window',
            },
          },
        },
      },
    },
  },

  install = { colorscheme = { 'gruvbox' } },

  ui = {
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
