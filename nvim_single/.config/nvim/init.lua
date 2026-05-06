---------------------------------------------------------------------------------------------------
--- [[ Lazy Setup ]] ------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

-- Bootstrap lazy.nvim
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
---------------------------------------------------------------------------------------------------
--- [[ Important Settings ]] ----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

---------------------------------------------------------------------------------------------------
--- [[ Basic Settings ]] --------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

vim.opt.number = true -- Line numbers
vim.opt.relativenumber = false -- Relative line num
vim.opt.cursorline = true -- Highlight current line

vim.opt.scrolloff = 8 -- Lines between edge of screen
vim.opt.sidescrolloff = 5 -- Side scrollof

vim.opt.wrap = false -- Don't wrap lines

-- vim.o.textwidth = 100
vim.opt.colorcolumn = '120' -- Show column at 100 characters
vim.cmd('let g:netrw_liststyle=3') -- Default file viewer to tree style

-- [[ Indentation ]]
-- vim.o.tabstop = 4  -- Default 8                          -- Tab width (prolly don't change)
vim.o.softtabstop = 4 -- Soft tab stop
vim.o.shiftwidth = 4 -- Indent width
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.autoindent = true -- Copy indent from current line
vim.o.smartindent = true -- Smart auto-indenting (might be messing up with 2 space tab lua files)

-- [[ Search settings ]]
vim.o.ignorecase = true -- Case insensitive search
vim.o.smartcase = true -- Case sensitive if uppercase in search
-- vim.o.hlsearch = false -- Don't highlight search results
vim.o.incsearch = true -- Show matches as you type
vim.o.inccommand = 'split' -- Preview substitutions live, as you type!

-- [[ Visual settings ]]
vim.o.termguicolors = true -- Enable 24-bit colors
vim.o.signcolumn = 'yes' -- Always show sign column
vim.o.completeopt = 'menuone,noinsert,noselect' -- Completion options
vim.o.showmode = false -- Don't show mode in command line
vim.o.showmatch = true -- Highlight matching brackets
-- vim.o.matchtime = 2 -- How long to show matching bracket

-- [[ File handling ]]

vim.o.undofile = true -- Persistent undo
vim.o.autoread = true -- Auto reload files changed outside vim

-- [[ Behavior Settings ]]
vim.o.updatetime = 250 -- Faster completion
vim.o.timeoutlen = 300 -- Key timeout duration
vim.opt.path:append('**') -- include subdirectories in search
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

---------------------------------------------------------------------------------------------------
--- [[ Basic Keymaps ]] ---------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
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
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

---------------------------------------------------------------------------------------------------
--- [[ Basic Autocommands ]] ----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
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

-- Add treesitter highlighting and other things
-- vim.api.nvim_create_autocmd('FileType', {
--     desc = 'Enable treesitter highlting for a filetype',
--     pattern = { '<filetype>' },
--     callback = function()
--         vim.treesitter.start()
--         -- Add fold methods
--         -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--         -- vim.wo[0][0].foldmethod = 'expr'
--         -- Add indentation (experimental)
--         vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--     end,
-- })

---------------------------------------------------------------------------------------------------
--- [[ Lazy Setup ]] ------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

require('lazy').setup({
    -----------------------------------------------------------------------------------------------
    --- [[ Plugin Installation & Setup ]] ---------------------------------------------------------
    -----------------------------------------------------------------------------------------------
    --- TOC:
    --- Treesitter
    --- LSP stuff
    --- formatting
    --- autocomplete
    --- linting
    --- neo-tree
    --- git-signs
    --- render-markdown
    --- indent-blankline
    --- autopairs
    --- todo comments
    --- colorscheme

    spec = {
        { -- Treesitter block

            'nvim-treesitter/nvim-treesitter',
            -- Recommended instal from readme
            branch = 'master',
            lazy = false,
            build = ':TSUpdate',
            --
            -- main = 'nvim-treesitter.configs', -- Sets main mod to use for opts

            opts = {
                ensure_installed = {
                    'bash',
                    'c',
                    'cmake',
                    'cpp',
                    'css',
                    'csv',
                    'diff',
                    'doxygen',
                    'editorconfig',
                    'git_config',
                    'gitcommit',
                    'gitignore',
                    'gpg',
                    'html',
                    'hyprlang',
                    'ini',
                    'java',
                    'javascript',
                    'javadoc',
                    'jq',
                    'jsdoc',
                    'json',
                    'json5',
                    'jsonc',
                    'latex',
                    'lua',
                    'luadoc',
                    'make',
                    'markdown',
                    'markdown_inline',
                    'passwd',
                    'powershell',
                    'printf',
                    'pymanifest',
                    'python',
                    'query',
                    'r',
                    'regex',
                    'requirements', -- pip requirement files
                    'rust',
                    'scheme',
                    'sql',
                    'ssh_config',
                    'sway',
                    'toml',
                    'typescript',
                    'udev',
                    'vim',
                    'vimdoc',
                    'xml',
                    'yaml',
                },
                -- Autoinstall languages that are not installed
                auto_install = true,
                highlight = {
                    enable = true,
                    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                    --  If you are experiencing weird indenting issues, add the language to
                    --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                    additional_vim_regex_highlighting = { 'ruby' },
                },
                indent = {
                    enable = true,
                    disable = { 'ruby' },
                },
            },
        },

        { -- Blink.cmp
            ---------------------------------------------------------------------------------------
            --- Autocompletion - Blink.cmp --------------------------------------------------------
            ---------------------------------------------------------------------------------------
            'saghen/blink.cmp',
            dependencies = {
                'saghen/blink.lib',
                -- optional: provides snippets for the snippet source
                'rafamadriz/friendly-snippets', -- default snippets
                'L3MON4D3/LuaSnip', -- lua snippets
            },
            build = function()
                -- build the fuzzy matcher, wait up to 60 seconds
                -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
                require('blink.cmp').build():wait(60000)
            end,

            ---@module 'blink.cmp'
            ---@type blink.cmp.Config
            opts = {
                -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
                -- 'super-tab' for mappings similar to vscode (tab to accept)
                -- 'enter' for enter to accept
                -- 'none' for no mappings
                --
                -- All presets have the following mappings:
                -- C-space: Open menu or open docs if already open
                -- C-n/C-p or Up/Down: Select next/previous item
                -- C-e: Hide menu
                -- C-k: Toggle signature help (if signature.enabled = true)
                --
                -- See :h blink-cmp-config-keymap for defining your own keymap
                keymap = {
                    preset = 'none',
                    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                    ['<C-e>'] = { 'hide', 'fallback' },
                    ['<C-y>'] = { 'select_and_accept', 'fallback' },

                    ['<Up>'] = { 'select_prev', 'fallback' },
                    ['<Down>'] = { 'select_next', 'fallback' },
                    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
                    ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

                    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

                    -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
                    -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
                    ['<C-l>'] = { 'snippet_forward', 'fallback' },
                    ['<C-h>'] = { 'snippet_backward', 'fallback' },

                    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
                },

                -- (Default) Only show the documentation popup when manually triggered
                completion = { documentation = { auto_show = false } },

                -- snippets
                snippets = { preset = 'luasnip' },

                -- (Default) list of enabled providers defined so that you can extend it
                -- elsewhere in your config, without redefining it, due to `opts_extend`
                sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },

                -- ensure you have the `snippets` source (enabled by default)

                -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
                -- You may use a lua implementation instead by using `implementation = "lua"`
                -- See the fuzzy documentation for more information
                fuzzy = { implementation = 'rust' },
            },
        },
        -------------------------------------------------------------------------------------------
        --- [[ LSP & Autocomplete Setup ]] --------------------------------------------------------
        -------------------------------------------------------------------------------------------
        {
            -- Mason: manages LSP servers and tools
            'mason-org/mason.nvim',
            opts = {},
        },

        { -- Mason tool installer: auto-installs tools on startup
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            dependencies = { 'mason-org/mason.nvim' },
            opts = {
                ensure_installed = {
                    -- LSP servers
                    'clangd',
                    'pyright',
                    'lua_ls',
                    'bashls',
                    -- 'emmet_language_server',
                    -- Formatters
                    'stylua',
                    'clang-format',
                    'black',
                    'prettierd',
                    'markdownlint-cli2',
                },
            },
        },

        {
            -- LSP config with mason integration
            'neovim/nvim-lspconfig',
            dependencies = {
                'mason-org/mason-lspconfig.nvim',
                'saghen/blink.cmp', -- for capabilities
            },
            config = function()
                local lspconfig = require('lspconfig')
                local mason_lspconfig = require('mason-lspconfig')
                local blink = require('blink.cmp')

                -- Get capabilities from blink.cmp
                local capabilities = blink.get_lsp_capabilities()

                -- LSP keymaps (applied when LSP attaches)
                local function on_attach(client, bufnr)
                    local function map(keys, func, desc)
                        vim.keymap.set('n', keys, func, {
                            buffer = bufnr,
                            desc = 'LSP: ' .. desc,
                        })
                    end

                    map('grd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map('gra', vim.lsp.buf.code_action, '[C]ode [A]ction')
                    map('grr', vim.lsp.buf.references, '[R]eferences')
                    map('grt', vim.lsp.buf.type_definition, '[T]ype [D]efinition')

                    -- Hover
                    map('K', vim.lsp.buf.hover, 'Hover')
                    map('<C-k>', vim.lsp.buf.signature_help, 'Signature Help')

                    -- Diagnostics
                    map('<leader>qd', vim.diagnostic.open_float, '[Q]uick [D]iagnostic')
                    map('[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
                    map(']d', vim.diagnostic.goto_next, 'Next Diagnostic')
                end

                -- Server configurations
                local servers = {
                    clangd = {
                        settings = {
                            Clangd = {
                                completeUnimported = true,
                                includeDirs = {
                                    strategy = 'compiledCommands',
                                },
                            },
                        },
                    },
                    lua_ls = {
                        settings = {
                            Lua = {
                                completion = { callSnippet = 'Replace' },
                            },
                        },
                    },
                    bashls = {
                        filetypes = { 'bash', 'sh', 'zsh', 'zshenv', 'zshrc' },
                    },
                    emmet_language_server = {
                        filetypes = { 'html', 'css', 'javascriptreact', 'typescriptreact' },
                    },
                }

                -- Setup servers via mason-lspconfig
                mason_lspconfig.setup({
                    handlers = {
                        function(server_name)
                            local server_config = servers[server_name] or {}
                            lspconfig[server_name].setup(vim.tbl_deep_extend('force', {
                                capabilities = capabilities,
                                on_attach = on_attach,
                            }, server_config))
                        end,
                    },
                })
            end,
        },

        -------------------------------------------------------------------------------------------
        --- [[ Auto-Format Setup - conform.nvim ]] ------------------------------------------------
        -------------------------------------------------------------------------------------------
        { -- conform.nvim
            'stevearc/conform.nvim',
            event = { 'BufWritePre' },
            cmd = { 'ConformInfo' },
            dependencies = { 'mason-org/mason.nvim' },
            keys = {
                {
                    '<leader>f',
                    function()
                        require('conform').format({ async = true, lsp_fallback = true })
                    end,
                    desc = '[F]ormat buffer',
                },
            },
            opts = {
                notify_on_error = false,
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
                formatters_by_ft = {
                    lua = { 'stylua' },
                    c = { 'clang-format' },
                    cpp = { 'clang-format' },
                    python = { 'black' },
                    javascript = { 'prettierd' },
                    javascriptreact = { 'prettierd' },
                    typescript = { 'prettierd' },
                    typescriptreact = { 'prettierd' },
                    html = { 'prettierd' },
                    css = { 'prettierd' },
                    json = { 'prettierd' },
                    yaml = { 'prettierd' },
                    markdown = { 'markdownlint-cli2', 'prettierd' },
                },
            },
        },

        { -- Linting
            'mfussenegger/nvim-lint',
            opts = {
                linters_by_ft = {
                    markdown = { 'markdownlint-cli2' },
                },
            },

            config = function(opts)
                -- setup plugin with opts
                require('lint').setup(opts)
                vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
                    callback = function()
                        -- try_lint without arguments runs the linters defined in `linters_by_ft`
                        -- for the current filetype
                        require('lint').try_lint()

                        -- You can call `try_lint` with a linter name or a list of names to always
                        -- run specific linters, independent of the `linters_by_ft` configuration
                        -- require('lint').try_lint('cspell')
                    end,
                })
            end,
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
        { -- Telescope block. Fuzzy Finder (files, lsp, etc)
            'nvim-telescope/telescope.nvim',
            event = 'VimEnter',
            dependencies = {
                'nvim-lua/plenary.nvim',
                { -- telescope-fzf-native config
                    -- If encountering errors, see telescope-fzf-native README for installation instructions
                    'nvim-telescope/telescope-fzf-native.nvim',

                    -- `build` is used to run some command when the plugin is installed/updated.
                    -- This is only run then, not every time Neovim starts up.
                    build = 'make',

                    -- `cond` is a condition used to determine whether this plugin should be
                    -- installed and loaded.
                    cond = function()
                        return vim.fn.executable('make') == 1
                    end,
                },
                { 'nvim-telescope/telescope-ui-select.nvim' },

                -- Useful for getting pretty icons, but requires a Nerd Font.
                { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
            },
            config = function()
                -- Telescope is a fuzzy finder that comes with a lot of different things that
                -- it can fuzzy find! It's more than just a "file finder", it can search
                -- many different aspects of Neovim, your workspace, LSP, and more!
                --
                -- The easiest way to use Telescope, is to start by doing something like:
                --  :Telescope help_tags
                --
                -- After running this command, a window will open up and you're able to
                -- type in the prompt window. You'll see a list of `help_tags` options and
                -- a corresponding preview of the help.
                --
                -- Two important keymaps to use while in Telescope are:
                --  - Insert mode: <c-/>
                --  - Normal mode: ?
                --
                -- This opens a window that shows you all of the keymaps for the current
                -- Telescope picker. This is really useful to discover what Telescope can
                -- do as well as how to actually do it!

                -- [[ Configure Telescope ]]
                -- See `:help telescope` and `:help telescope.setup()`
                require('telescope').setup({
                    -- You can put your default mappings / updates / etc. in here
                    --  All the info you're looking for is in `:help telescope.setup()`
                    --
                    -- defaults = {
                    --   mappings = {
                    --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
                    --   },
                    -- },
                    -- pickers = {}
                    extensions = {
                        ['ui-select'] = {
                            require('telescope.themes').get_dropdown(),
                        },
                    },
                })

                -- Enable Telescope extensions if they are installed
                pcall(require('telescope').load_extension, 'fzf')
                pcall(require('telescope').load_extension, 'ui-select')

                -- See `:help telescope.builtin`
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
                vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
                vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
                vim.keymap.set(
                    'n',
                    '<leader>ss',
                    builtin.builtin,
                    { desc = '[S]earch [S]elect Telescope' }
                )
                vim.keymap.set(
                    'n',
                    '<leader>sw',
                    builtin.grep_string,
                    { desc = '[S]earch current [W]ord' }
                )
                vim.keymap.set(
                    'n',
                    '<leader>sg',
                    builtin.live_grep,
                    { desc = '[S]earch by [G]rep' }
                )
                vim.keymap.set(
                    'n',
                    '<leader>sd',
                    builtin.diagnostics,
                    { desc = '[S]earch [D]iagnostics' }
                )
                vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
                vim.keymap.set(
                    'n',
                    '<leader>s.',
                    builtin.oldfiles,
                    { desc = '[S]earch Recent Files ("." for repeat)' }
                )
                vim.keymap.set(
                    'n',
                    '<leader><leader>',
                    builtin.buffers,
                    { desc = '[ ] Find existing buffers' }
                )

                -- Slightly advanced example of overriding default behavior and theme
                vim.keymap.set('n', '<leader>/', function()
                    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                        winblend = 10,
                        previewer = false,
                    }))
                end, { desc = '[/] Fuzzily search in current buffer' })

                -- It's also possible to pass additional configuration options.
                --  See `:help telescope.builtin.live_grep()` for information about particular keys
                vim.keymap.set('n', '<leader>s/', function()
                    builtin.live_grep({
                        grep_open_files = true,
                        prompt_title = 'Live Grep in Open Files',
                    })
                end, { desc = '[S]earch [/] in Open Files' })

                -- Shortcut for searching your Neovim configuration files
                vim.keymap.set('n', '<leader>sn', function()
                    builtin.find_files({ cwd = vim.fn.stdpath('config') })
                end, { desc = '[S]earch [N]eovim files' })
            end,
        },
        -------------------------------------------------------------------------------------------
        --- [[ Other plugins ]] -------------------------------------------------------------------
        -------------------------------------------------------------------------------------------
        { -- git-signs: view hunks/stage changes
            'lewis6991/gitsigns.nvim',
            -- Base config included in kickstart init
            opts = {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ ']c', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    map('n', '[c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[c', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    -- Actions
                    map('n', '<leader>hs', gitsigns.stage_hunk)
                    map('n', '<leader>hr', gitsigns.reset_hunk)

                    map('v', '<leader>hs', function()
                        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end)

                    map('v', '<leader>hr', function()
                        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end)

                    map('n', '<leader>hS', gitsigns.stage_buffer)
                    map('n', '<leader>hR', gitsigns.reset_buffer)
                    map('n', '<leader>hp', gitsigns.preview_hunk)
                    map('n', '<leader>hi', gitsigns.preview_hunk_inline)

                    map('n', '<leader>hb', function()
                        gitsigns.blame_line({ full = true })
                    end)

                    map('n', '<leader>hd', gitsigns.diffthis)

                    map('n', '<leader>hD', function()
                        gitsigns.diffthis('~')
                    end)

                    map('n', '<leader>hQ', function()
                        gitsigns.setqflist('all')
                    end)
                    map('n', '<leader>hq', gitsigns.setqflist)

                    -- Toggles
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                    map('n', '<leader>tw', gitsigns.toggle_word_diff)

                    -- Text object
                    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
                end,
            },
        },

        { -- Render Markdown
            'MeanderingProgrammer/render-markdown.nvim',
            dependencies = {
                'nvim-treesitter/nvim-treesitter',

                'nvim-mini/mini.nvim', -- if you use the mini.nvim suite
            },
            -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
            -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
            ---@module 'render-markdown'
            ---@type render.md.UserConfig
            opts = {
                completions = {
                    blink = { enabled = true },
                },
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

        -------------------------------------------------------------------------------------------
        --- [[ Colorscheme Setup ]] ---------------------------------------------------------------
        -------------------------------------------------------------------------------------------
        { --- Gruvbox -----------------------------------------------------------------------------
            'ellisonleao/gruvbox.nvim',
            opts = {
                -- contrast = 'soft',
                contrast = 'medium',
                -- contrast = 'hard',
                dim_inactive = true,
                -- transparent_mode = true,
            },
            init = function()
                -- vim.cmd('colorscheme gruvbox')
                vim.cmd.colorscheme('gruvbox')
                -- vim.o.background = 'light'
                vim.o.background = 'dark'
                -- vim.o.background = 'transparent'
            end,
        },
        install = { colorscheme = { 'gruvbox' } },
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
    },
})
