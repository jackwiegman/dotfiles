---------------------------------------------------------------------------------------------------
--- [[ Important Settings ]] ----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

---------------------------------------------------------------------------------------------------
--- [[ Basic Settings ]] --------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

vim.o.number = true -- Line numbers
vim.o.relativenumber = false -- Relative line num
vim.o.cursorline = true -- Highlight current line

vim.o.scrolloff = 8 -- Lines between edge of screen
vim.o.sidescrolloff = 5 -- Side scrollof

vim.o.wrap = false -- Don't wrap lines

-- vim.o.textwidth = 100
vim.o.colorcolumn = '120' -- Show column at 100 characters
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
-- vim.o.completeopt = 'menuone,noinsert,noselect' -- Completion options
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

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },

    -- Can switch between these as you prefer
    virtual_text = true, -- Text shows up at the end of the line
    virtual_lines = false, -- Text shows up underneath the line, with virtual lines

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = { float = true },
})

vim.keymap.set(
    'n',
    '<leader>q',
    vim.diagnostic.setloclist,
    { desc = 'Open diagnostic [Q]uickfix list' }
)

-- -- Diagnostic keymaps
-- -- Pulls up quickfix list
-- vim.keymap.set(
--     'n',
--     '<leader>q',
--     vim.diagnostic.setloclist,
--     { desc = 'Open diagnostic [Q]uickfix list' }
-- )

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
-- vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
-- vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
-- vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
-- vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

---------------------------------------------------------------------------------------------------
--- [[ Basic Autocommands ]] ----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-on-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- local TSparsers = {
--     'bash',
--     'c',
--     'cmake',
--     'cpp',
--     'css',
--     'csv',
--     'diff',
--     'doxygen',
--     'editorconfig',
--     'git_config',
--     'gitcommit',
--     'gitignore',
--     'gpg',
--     'html',
--     'hyprlang',
--     'ini',
--     'java',
--     'javascript',
--     'javadoc',
--     'jq',
--     'jsdoc',
--     'json',
--     'json5',
--     'jsonc',
--     'latex',
--     'lua',
--     'luadoc',
--     'make',
--     'markdown',
--     'markdown_inline',
--     'passwd',
--     'powershell',
--     'printf',
--     'pymanifest',
--     'python',
--     'query',
--     'r',
--     'regex',
--     'requirements', -- pip requirement files
--     'rust',
--     'scheme',
--     'sql',
--     'ssh_config',
--     'sway',
--     'toml',
--     'typescript',
--     'udev',
--     'vim',
--     'vimdoc',
--     'xml',
--     'yaml',
-- }

-- Add treesitter highlighting and other things
-- vim.api.nvim_create_autocmd('FileType', {
--     desc = 'Enable treesitter highlting for a filetype',
--     pattern = TSparsers,
--     callback = function()
--         vim.treesitter.start()
--         -- Add fold methods
--         -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--         -- vim.wo[0][0].foldmethod = 'expr'
--         -- Add indentation (experimental)
--         -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--     end,
-- })

---------------------------------------------------------------------------------------------------
--- [[ Lazy Setup ]] ------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

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

    ---@module 'lazy'
    ---@type LazySpec
    spec = {
        -- { 'NMAC427/guess-indent.nvim', opts = {} },
        { -- Adds git related signs to the gutter, as well as utilities for managing changes
            'lewis6991/gitsigns.nvim',
            ---@module 'gitsigns'
            ---@type Gitsigns.Config
            ---@diagnostic disable-next-line: missing-fields
            opts = {
                signs = {
                    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
                    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
                    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
                    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
                    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
                },
            },
        },
        { -- Useful plugin to show you pending keybinds.
            'folke/which-key.nvim',
            event = 'VimEnter',
            ---@module 'which-key'
            ---@type wk.Opts
            ---@diagnostic disable-next-line: missing-fields
            opts = {
                -- delay between pressing a key and opening which-key (milliseconds)
                delay = 0,
                icons = { mappings = vim.g.have_nerd_font },

                -- Document existing key chains
                spec = {
                    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
                    { '<leader>t', group = '[T]oggle' },
                    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
                    { 'gr', group = 'LSP Actions', mode = { 'n' } },
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

                -- This runs on LSP attach per buffer (see main LSP attach function in 'neovim/nvim-lspconfig' config for more info,
                -- it is better explained there). This allows easily switching between pickers if you prefer using something else!
                vim.api.nvim_create_autocmd('LspAttach', {
                    group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
                    callback = function(event)
                        local buf = event.buf

                        -- Find references for the word under your cursor.
                        vim.keymap.set(
                            'n',
                            'grr',
                            builtin.lsp_references,
                            { buffer = buf, desc = '[G]oto [R]eferences' }
                        )

                        -- Jump to the implementation of the word under your cursor.
                        -- Useful when your language has ways of declaring types without an actual implementation.
                        vim.keymap.set(
                            'n',
                            'gri',
                            builtin.lsp_implementations,
                            { buffer = buf, desc = '[G]oto [I]mplementation' }
                        )

                        -- Jump to the definition of the word under your cursor.
                        -- This is where a variable was first declared, or where a function is defined, etc.
                        -- To jump back, press <C-t>.
                        vim.keymap.set(
                            'n',
                            'grd',
                            builtin.lsp_definitions,
                            { buffer = buf, desc = '[G]oto [D]efinition' }
                        )

                        -- Fuzzy find all the symbols in your current document.
                        -- Symbols are things like variables, functions, types, etc.
                        vim.keymap.set(
                            'n',
                            'gO',
                            builtin.lsp_document_symbols,
                            { buffer = buf, desc = 'Open Document Symbols' }
                        )

                        -- Fuzzy find all the symbols in your current workspace.
                        -- Similar to document symbols, except searches over your entire project.
                        vim.keymap.set(
                            'n',
                            'gW',
                            builtin.lsp_dynamic_workspace_symbols,
                            { buffer = buf, desc = 'Open Workspace Symbols' }
                        )

                        -- Jump to the type of the word under your cursor.
                        -- Useful when you're not sure what type a variable is and you want to see
                        -- the definition of its *type*, not where it was *defined*.
                        vim.keymap.set(
                            'n',
                            'grt',
                            builtin.lsp_type_definitions,
                            { buffer = buf, desc = '[G]oto [T]ype Definition' }
                        )
                    end,
                })

                -- Override default behavior and theme when searching
                vim.keymap.set('n', '<leader>/', function()
                    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                        winblend = 10,
                        previewer = false,
                    }))
                end, { desc = '[/] Fuzzily search in current buffer' })

                -- -- Slightly advanced example of overriding default behavior and theme
                -- vim.keymap.set('n', '<leader>/', function()
                --     -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                --     builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                --         winblend = 10,
                --         previewer = false,
                --     }))
                -- end, { desc = '[/] Fuzzily search in current buffer' })

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
        --

        -------------------------------------------------------------------------------------------
        --- [[ LSP Setup ]] --------------------------------------------------------
        -------------------------------------------------------------------------------------------
        {
            'neovim/nvim-lspconfig',
            dependencies = {
                {
                    'mason-org/mason.nvim',
                    ---@module 'mason.settings'
                    ---@type MasonSettings
                    ---@diagnostic disable-next-line: missing-fields
                    opts = {},
                },

                'mason-org/mason-lspconfig.nvim',
                'WhoIsSethDaniel/mason-tool-installer.nvim',

                -- Useful status updates for LSP.
                -- { 'j-hui/fidget.nvim', opts = {} },
            },
            config = function()
                -- create attatch events for servers
                vim.api.nvim_create_autocmd('LspAttach', {
                    group = vim.api.nvim_create_augroup('lsp-attatch', { clear = true }),
                    callback = function(event)
                        -- function to more easily define mappings for lsp items.
                        -- set mode, buffer, and description each time.
                        local map = function(keys, func, desc, mode)
                            mode = mode or 'n'
                            vim.keymap.set(
                                mode,
                                keys,
                                func,
                                { buffer = event.buf, desc = 'LSP: ' .. desc }
                            )
                        end

                        -- Rename the variable under your cursor.
                        --  Most Language Servers support renaming across files, etc.
                        map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

                        -- Execute a code action, usually your cursor needs to be on top of an error
                        -- or a suggestion from your LSP for this to activate.
                        map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

                        -- WARN: This is not Goto Definition, this is Goto Declaration.
                        --  For example, in C this would take you to the header.
                        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                        local client = vim.lsp.get_client_by_id(event.data.client_id)
                        if
                            client
                            and client:supports_method('textDocument/documentHighlight', event.buf)
                        then
                            local highlight_augroup =
                                vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
                            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                                buffer = event.buf,
                                group = highlight_augroup,
                                callback = vim.lsp.buf.document_highlight,
                            })

                            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                                buffer = event.buf,
                                group = highlight_augroup,
                                callback = vim.lsp.buf.clear_references,
                            })

                            vim.api.nvim_create_autocmd('LspDetach', {
                                group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                                callback = function(event2)
                                    vim.lsp.buf.clear_references()
                                    vim.api.nvim_clear_autocmds({
                                        group = 'lsp-highlight',
                                        buffer = event2.buf,
                                    })
                                end,
                            })
                        end

                        -- The following code creates a keymap to toggle inlay hints in your
                        -- code, if the language server you are using supports them
                        --
                        -- This may be unwanted, since they displace some of your code
                        if
                            client and client:supports_method('textDocument/inlayHint', event.buf)
                        then
                            map('<leader>th', function()
                                vim.lsp.inlay_hint.enable(
                                    not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
                                )
                            end, '[T]oggle Inlay [H]ints')
                        end
                    end,
                })

                -- Enable the following language servers
                --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
                --  See `:help lsp-config` for information about keys and how to configure
                ---@type table<string, vim.lsp.Config>
                local servers = {
                    -- clangd = {},
                    -- gopls = {},
                    -- pyright = {},
                    -- rust_analyzer = {},
                    --
                    -- Some languages (like typescript) have entire language plugins that can be useful:
                    --    https://github.com/pmizio/typescript-tools.nvim
                    --
                    -- But for many setups, the LSP (`ts_ls`) will work just fine
                    -- ts_ls = {},

                    stylua = {}, -- Used to format Lua code

                    -- Special Lua Config, as recommended by neovim help docs
                    lua_ls = {
                        on_init = function(client)
                            client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

                            if client.workspace_folders then
                                local path = client.workspace_folders[1].name
                                if
                                    path ~= vim.fn.stdpath('config')
                                    and (
                                        vim.uv.fs_stat(path .. '/.luarc.json')
                                        or vim.uv.fs_stat(path .. '/.luarc.jsonc')
                                    )
                                then
                                    return
                                end
                            end

                            client.config.settings.Lua =
                                vim.tbl_deep_extend('force', client.config.settings.Lua, {
                                    runtime = {
                                        version = 'LuaJIT',
                                        path = { 'lua/?.lua', 'lua/?/init.lua' },
                                    },
                                    workspace = {
                                        checkThirdParty = false,
                                        -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                                        --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                                        library = vim.tbl_extend(
                                            'force',
                                            vim.api.nvim_get_runtime_file('', true),
                                            {
                                                '${3rd}/luv/library',
                                                '${3rd}/busted/library',
                                            }
                                        ),
                                    },
                                })
                        end,
                        ---@type lspconfig.settings.lua_ls
                        settings = {
                            Lua = {
                                format = { enable = false }, -- Disable formatting (formatting is done by stylua)
                            },
                        },
                    },
                }

                -- Ensure the servers and tools above are installed
                --
                -- To check the current status of installed tools and/or manually install
                -- other tools, you can run
                --    :Mason
                --
                -- You can press `g?` for help in this menu.
                local ensure_installed = vim.tbl_keys(servers or {})
                vim.list_extend(ensure_installed, {
                    -- You can add other tools here that you want Mason to install
                })

                require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

                for name, server in pairs(servers) do
                    vim.lsp.config(name, server)
                    vim.lsp.enable(name)
                end
            end,
        },

        { -- Autoformat
            'stevearc/conform.nvim',
            event = { 'BufWritePre' },
            cmd = { 'ConformInfo' },
            keys = {
                {
                    '<leader>f',
                    function()
                        require('conform').format({ async = true })
                    end,
                    mode = '',
                    desc = '[F]ormat buffer',
                },
            },
            ---@module 'conform'
            ---@type conform.setupOpts
            opts = {
                notify_on_error = false,
                format_on_save = function(bufnr)
                    -- You can specify filetypes to autoformat on save here:
                    local enabled_filetypes = {
                        lua = true,
                        python = true,
                    }
                    if enabled_filetypes[vim.bo[bufnr].filetype] then
                        return { timeout_ms = 500 }
                    else
                        return nil
                    end
                end,
                default_format_opts = {
                    lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
                },
                -- You can also specify external formatters in here.
                formatters_by_ft = {
                    lua = { 'stylua' },
                    c = { 'clang-format' },
                    cpp = { 'clang-format' },
                    python = { 'black' },
                    -- javascript = { 'prettierd' },
                    -- javascriptreact = { 'prettierd' },
                    -- typescript = { 'prettierd' },
                    -- typescriptreact = { 'prettierd' },
                    html = { 'prettierd' },
                    css = { 'prettierd' },
                    json = { 'prettierd', fallback = 'jq' },
                    yaml = { 'prettierd' },
                    markdown = { 'markdownlint-cli2', 'prettierd' },
                    -- rust = { 'rustfmt' },
                    --
                    -- Conform can also run multiple formatters sequentially
                    -- python = { "isort", "black" },
                    --
                    -- You can use 'stop_after_first' to run the first available formatter from the list
                    -- javascript = { "prettierd", "prettier", stop_after_first = true },
                },
            },
        },

        { -- Autocompletion
            'saghen/blink.cmp',
            event = 'VimEnter',
            version = '1.*',
            dependencies = {
                -- Snippet Engine
                {
                    'L3MON4D3/LuaSnip',
                    version = '2.*',
                    build = (function()
                        -- Build Step is needed for regex support in snippets.
                        -- This step is not supported in many windows environments.
                        -- Remove the below condition to re-enable on windows.
                        if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
                            return
                        end
                        return 'make install_jsregexp'
                    end)(),
                    dependencies = {

                        -- `friendly-snippets` contains a variety of premade snippets.
                        --    See the README about individual language/framework/plugin snippets:
                        --    https://github.com/rafamadriz/friendly-snippets
                        -- {
                        --   'rafamadriz/friendly-snippets',
                        --   config = function()
                        --     require('luasnip.loaders.from_vscode').lazy_load()
                        --   end,
                        -- },
                    },
                    opts = {},
                },
                { 'Bilal2453/luvit-meta', lazy = true },
                { -- Lazydev setup block
                    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
                    -- used for completion, annotations and signatures of Neovim apis
                    'folke/lazydev.nvim',
                    ft = 'lua',
                    opts = {
                        library = {
                            -- Load luvit types when the `vim.uv` word is found
                            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                        },
                    },
                },
            },
            ---@module 'blink.cmp'
            ---@type blink.cmp.Config
            opts = {
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

                    -- vim.keymap.del('i', '<C-k>', {buffer = bufnr}), -- delete current keybind
                    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
                },
                -- keymap = {
                --     -- 'default' (recommended) for mappings similar to built-in completions
                --     --   <c-y> to accept ([y]es) the completion.
                --     --    This will auto-import if your LSP supports it.
                --     --    This will expand snippets if the LSP sent a snippet.
                --     -- 'super-tab' for tab to accept
                --     -- 'enter' for enter to accept
                --     -- 'none' for no mappings
                --     --
                --     -- For an understanding of why the 'default' preset is recommended,
                --     -- you will need to read `:help ins-completion`
                --     --
                --     -- No, but seriously. Please read `:help ins-completion`, it is really good!
                --     --
                --     -- All presets have the following mappings:
                --     -- <tab>/<s-tab>: move to right/left of your snippet expansion
                --     -- <c-space>: Open menu or open docs if already open
                --     -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
                --     -- <c-e>: Hide menu
                --     -- <c-k>: Toggle signature help
                --     --
                --     -- See :h blink-cmp-config-keymap for defining your own keymap
                --     preset = 'default',
                --
                --     -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
                --     --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
                -- },

                appearance = {
                    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                    -- Adjusts spacing to ensure icons are aligned
                    nerd_font_variant = 'mono',
                },

                completion = {
                    -- By default, you may press `<c-space>` to show the documentation.
                    -- Optionally, set `auto_show = true` to show the documentation after a delay.
                    documentation = { auto_show = false, auto_show_delay_ms = 500 },
                },

                sources = { default = { 'lsp', 'path', 'snippets' } },

                snippets = { preset = 'luasnip' },
                -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
                -- which automatically downloads a prebuilt binary when enabled.
                --
                -- By default, we use the Lua implementation instead, but you may enable
                -- the rust implementation via `'prefer_rust_with_warning'`
                --
                -- See :h blink-cmp-config-fuzzy for more information
                fuzzy = { implementation = 'prefer_rust_with_warning' },

                -- Shows a signature help window while you type arguments for a function
                signature = { enabled = true },
            },
            opts_extend = { 'sources.default' },
        },

        -- Linting

        {
            'mfussenegger/nvim-lint',
            event = { 'BufReadPre', 'BufNewFile' },
            config = function()
                local lint = require('lint')
                lint.linters_by_ft = {
                    markdown = { 'markdownlint' }, -- Make sure to install `markdownlint` via mason / npm
                }

                -- To allow other plugins to add linters to require('lint').linters_by_ft,
                -- instead set linters_by_ft like this:
                -- lint.linters_by_ft = lint.linters_by_ft or {}
                -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
                --
                -- However, note that this will enable a set of default linters,
                -- which will cause errors unless these tools are available:
                -- {
                --   clojure = { "clj-kondo" },
                --   dockerfile = { "hadolint" },
                --   inko = { "inko" },
                --   janet = { "janet" },
                --   json = { "jsonlint" },
                --   markdown = { "vale" },
                --   rst = { "vale" },
                --   ruby = { "ruby" },
                --   terraform = { "tflint" },
                --   text = { "vale" }
                -- }
                --
                -- You can disable the default linters by setting their filetypes to nil:
                -- lint.linters_by_ft['clojure'] = nil
                -- lint.linters_by_ft['dockerfile'] = nil
                -- lint.linters_by_ft['inko'] = nil
                -- lint.linters_by_ft['janet'] = nil
                -- lint.linters_by_ft['json'] = nil
                -- lint.linters_by_ft['markdown'] = nil
                -- lint.linters_by_ft['rst'] = nil
                -- lint.linters_by_ft['ruby'] = nil
                -- lint.linters_by_ft['terraform'] = nil
                -- lint.linters_by_ft['text'] = nil

                -- Create autocommand which carries out the actual linting
                -- on the specified events.
                local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
                vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
                    group = lint_augroup,
                    callback = function()
                        -- Only run the linter in buffers that you can modify in order to
                        -- avoid superfluous noise, notably within the handy LSP pop-ups that
                        -- describe the hovered symbol using Markdown.
                        if vim.bo.modifiable then
                            lint.try_lint()
                        end
                    end,
                })
            end,
        },

        -- Highlight todo, notes, etc in comments
        {
            'folke/todo-comments.nvim',
            event = 'VimEnter',
            dependencies = { 'nvim-lua/plenary.nvim' },
            ---@module 'todo-comments'
            ---@type TodoOptions
            ---@diagnostic disable-next-line: missing-fields
            opts = { signs = false },
        },

        { -- Collection of various small independent plugins/modules
            'nvim-mini/mini.nvim',
            config = function()
                -- Better Around/Inside textobjects
                --
                -- Examples:
                --  - va)  - [V]isually select [A]round [)]paren
                --  - yiiq - [Y]ank [I]nside [I]+1 [Q]uote
                --  - ci'  - [C]hange [I]nside [']quote
                require('mini.ai').setup({
                    -- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
                    mappings = {
                        around_next = 'aa',
                        inside_next = 'ii',
                    },
                    n_lines = 500,
                })

                -- Add/delete/replace surroundings (brackets, quotes, etc.)
                --
                -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
                -- - sd'   - [S]urround [D]elete [']quotes
                -- - sr)'  - [S]urround [R]eplace [)] [']
                require('mini.surround').setup()

                -- Simple and easy statusline.
                --  You could remove this setup call if you don't like it,
                --  and try some other statusline plugin
                local statusline = require('mini.statusline')
                -- set use_icons to true if you have a Nerd Font
                statusline.setup({ use_icons = vim.g.have_nerd_font })

                -- You can configure sections in the statusline by overriding their
                -- default behavior. For example, here we set the section for
                -- cursor location to LINE:COLUMN
                ---@diagnostic disable-next-line: duplicate-set-field
                statusline.section_location = function()
                    return '%2l:%-2v'
                end

                -- ... and there is more!
                --  Check out: https://github.com/nvim-mini/mini.nvim
            end,
        },
        -- {
        --     'nvim-treesitter/nvim-treesitter',
        --     lazy = false,
        --     build = ':TSUpdate',
        --     opts = {
        --         ensure_installed = {
        --             'bash',
        --             'c',
        --             'cpp',
        --             'markdown',
        --             'markdown_inline',
        --         },
        --     },
        --
        --     config = function(opts)
        --         -- require('nvim-treesitter').add({ opts.ensure_installed })
        --         vim.api.nvim_create_autocmd('FileType', {
        --             pattern = opts.ensure_installed,
        --             callback = function()
        --                 vim.treesitter.start()
        --             end,
        --         })
        --
        --         require('nvim-treesitter.configs').setup({
        --             -- A directory to install the parsers into.
        --             -- If this is excluded or nil parsers are installed
        --             -- to either the package dir, or the "site" dir.
        --             -- If a custom path is used (not nil) it must be added to the runtimepath.
        --             parser_install_dir = '/home/jack/.local/share/nvim/parsers',
        --
        --             -- A list of parser names, or "all"
        --             ensure_installed = opts.ensure_installed,
        --
        --             -- Install parsers synchronously (only applied to `ensure_installed`)
        --             sync_install = false,
        --
        --             -- Automatically install missing parsers when entering buffer
        --             auto_install = false,
        --
        --             -- List of parsers to ignore installing (for "all")
        --             ignore_install = { 'javascript' },
        --
        --             highlight = {
        --                 -- `false` will disable the whole extension
        --                 enable = true,
        --
        --                 -- list of language that will be disabled
        --                 -- disable = { 'c', 'rust' },
        --
        --                 -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        --                 -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        --                 -- Using this option may slow down your editor, and you may see some duplicate highlights.
        --                 -- Instead of true it can also be a list of languages
        --                 additional_vim_regex_highlighting = false,
        --             },
        --         })
        --         vim.opt.runtimepath:append('/home/jack/.local/share/nvim/parsers')
        --     end,
        -- },
        { -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            lazy = false,
            build = ':TSUpdate',
            main = 'nvim-treesitter.configs',
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
                -- ensure_installed = {
                --
                --     'bash',
                --     'c',
                --     'cpp',
                --     'diff',
                --     'html',
                --     'lua',
                --     'luadoc',
                --     'markdown',
                --     'markdown_inline',
                --     'query',
                --     'vim',
                --     'vimdoc',
                --     -- Add more as needed
                -- },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            },
        },
        -- { -- Highlight, edit, and navigate code
        --     'nvim-treesitter/nvim-treesitter',
        --     lazy = false,
        --     build = ':TSUpdate',
        --     -- branch = 'main',
        --     -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
        --     config = function()
        --         -- ensure basic parser are installed
        --         local parsers = {
        --             'bash',
        --             'c',
        --             'diff',
        --             'html',
        --             'lua',
        --             'luadoc',
        --             'markdown',
        --             'markdown_inline',
        --             'query',
        --             'vim',
        --             'vimdoc',
        --         }
        --         -- local parsers = {
        --         --     'bash',
        --         --     'c',
        --         --     'cmake',
        --         --     'cpp',
        --         --     'css',
        --         --     'csv',
        --         --     'diff',
        --         --     'doxygen',
        --         --     'editorconfig',
        --         --     'git_config',
        --         --     'gitcommit',
        --         --     'gitignore',
        --         --     'gpg',
        --         --     'html',
        --         --     'hyprlang',
        --         --     'ini',
        --         --     'java',
        --         --     'javascript',
        --         --     'javadoc',
        --         --     'jq',
        --         --     'jsdoc',
        --         --     'json',
        --         --     'json5',
        --         --     'jsonc',
        --         --     'latex',
        --         --     'lua',
        --         --     'luadoc',
        --         --     'make',
        --         --     'markdown',
        --         --     'markdown_inline',
        --         --     'passwd',
        --         --     'powershell',
        --         --     'printf',
        --         --     'pymanifest',
        --         --     'python',
        --         --     'query',
        --         --     'r',
        --         --     'regex',
        --         --     'requirements', -- pip requirement files
        --         --     'rust',
        --         --     'scheme',
        --         --     'sql',
        --         --     'ssh_config',
        --         --     'sway',
        --         --     'toml',
        --         --     'typescript',
        --         --     'udev',
        --         --     'vim',
        --         --     'vimdoc',
        --         --     'xml',
        --         --     'yaml',
        --         -- }
        --
        --         -- require('nvim-treesitter').install(parsers)
        --
        --         ---@param buf integer
        --         ---@param language string
        --         local function treesitter_try_attach(buf, language)
        --             -- check if parser exists and load it
        --             if not vim.treesitter.language.add(language) then
        --                 return
        --             end
        --             -- enables syntax highlighting and other treesitter features
        --             vim.treesitter.start(buf, language)
        --
        --             -- enables treesitter based folds
        --             -- for more info on folds see `:help folds`
        --             -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        --             -- vim.wo.foldmethod = 'expr'
        --
        --             -- check if treesitter indentation is available for this language, and if so enable it
        --             -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
        --             local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil
        --
        --             -- enables treesitter based indentation
        --             if has_indent_query then
        --                 vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        --             end
        --         end
        --
        --         local available_parsers = require('nvim-treesitter').get_available()
        --         vim.api.nvim_create_autocmd('FileType', {
        --             callback = function(args)
        --                 local buf, filetype = args.buf, args.match
        --
        --                 local language = vim.treesitter.language.get_lang(filetype)
        --                 if not language then
        --                     return
        --                 end
        --
        --                 local installed_parsers =
        --                     require('nvim-treesitter').get_installed('parsers')
        --
        --                 if vim.tbl_contains(installed_parsers, language) then
        --                     -- enable the parser if it is installed
        --                     treesitter_try_attach(buf, language)
        --                 elseif vim.tbl_contains(available_parsers, language) then
        --                     -- if a parser is available in `nvim-treesitter` auto install it, and enable it after the installation is done
        --                     require('nvim-treesitter').install(language):await(function()
        --                         treesitter_try_attach(buf, language)
        --                     end)
        --                 else
        --                     -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
        --                     treesitter_try_attach(buf, language)
        --                 end
        --             end,
        --         })
        --     end,
        -- },

        -------------------------------------------------------------------------------------------
        --- [[ Other plugins ]] -------------------------------------------------------------------
        -------------------------------------------------------------------------------------------

        -- Neo-tree is a Neovim plugin to browse the file system
        -- https://github.com/nvim-neo-tree/neo-tree.nvim

        ---@module 'lazy'
        ---@type LazySpec
        { -- neotree
            'nvim-neo-tree/neo-tree.nvim',
            -- version = '*',
            dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
                'MunifTanjim/nui.nvim',
            },
            lazy = true,
            keys = {
                { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
            },
            ---@module 'neo-tree'
            ---@type neotree.Config
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

        -- Adds git related signs to the gutter, as well as utilities for managing changes
        -- NOTE: gitsigns is already included in init.lua but contains only the base
        -- config. This will add also the recommended keymaps.

        ---@module 'lazy'
        ---@type LazySpec
        { -- Git signs
            'lewis6991/gitsigns.nvim',
            ---@module 'gitsigns'
            ---@type Gitsigns.Config
            ---@diagnostic disable-next-line: missing-fields
            opts = {
                signs = {
                    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
                    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
                    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
                    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
                    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
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
                    end, { desc = 'Jump to next git [c]hange' })

                    map('n', '[c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[c', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end, { desc = 'Jump to previous git [c]hange' })

                    -- Actions
                    -- visual mode
                    map('v', '<leader>hs', function()
                        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, { desc = 'git [s]tage hunk' })
                    map('v', '<leader>hr', function()
                        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, { desc = 'git [r]eset hunk' })
                    -- normal mode
                    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
                    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
                    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
                    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
                    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
                    map(
                        'n',
                        '<leader>hi',
                        gitsigns.preview_hunk_inline,
                        { desc = 'git preview hunk [i]nline' }
                    )
                    map('n', '<leader>hb', function()
                        gitsigns.blame_line({ full = true })
                    end, { desc = 'git [b]lame line' })
                    map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
                    map('n', '<leader>hD', function()
                        gitsigns.diffthis('@')
                    end, { desc = 'git [D]iff against last commit' })
                    map('n', '<leader>hQ', function()
                        gitsigns.setqflist('all')
                    end, {
                        desc = 'git hunk [Q]uickfix list (all files in repo)',
                    })
                    map(
                        'n',
                        '<leader>hq',
                        gitsigns.setqflist,
                        { desc = 'git hunk [q]uickfix list (all changes in this file)' }
                    )
                    -- Toggles
                    map(
                        'n',
                        '<leader>tb',
                        gitsigns.toggle_current_line_blame,
                        { desc = '[T]oggle git show [b]lame line' }
                    )
                    map(
                        'n',
                        '<leader>tw',
                        gitsigns.toggle_word_diff,
                        { desc = '[T]oggle git intra-line [w]ord diff' }
                    )

                    -- Text object
                    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
                end,
            },
        },
        --
        {
            'windwp/nvim-autopairs',
            event = 'InsertEnter',
            opts = {},
        },

        -- { -- Render Markdown
        --     'MeanderingProgrammer/render-markdown.nvim',
        --     enabled = false,
        --     dependencies = {
        --         'nvim-treesitter/nvim-treesitter',
        --         'nvim-tree/nvim-web-devicons',
        --         'nvim-mini/mini.icons',
        --
        --         -- 'nvim-mini/mini.nvim', -- if you use the mini.nvim suite
        --     },
        --     ft = { 'markdown' },
        --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        --     ---@module 'render-markdown'
        --     ---@type render.md.UserConfig
        --     opts = {
        --         completions = {
        --             lsp = { enabled = true },
        --             blink = { enabled = true },
        --         },
        --     },
        -- },

        --
        -- Primarily focused on configuring the debugger for Go, but can
        -- be extended to other languages as well. That's why it's called
        -- kickstart.nvim and not kitchen-sink.nvim ;)

        ---@module 'lazy'
        ---@type LazySpec
        {
            -- NOTE: Yes, you can install new plugins here!
            'mfussenegger/nvim-dap',
            -- NOTE: And you can specify dependencies as well
            dependencies = {
                -- Creates a beautiful debugger UI
                'rcarriga/nvim-dap-ui',

                -- Required dependency for nvim-dap-ui
                'nvim-neotest/nvim-nio',

                -- Installs the debug adapters for you
                'mason-org/mason.nvim',
                'jay-babu/mason-nvim-dap.nvim',

                -- Add your own debuggers here
                'leoluz/nvim-dap-go',
            },
            keys = {
                -- Basic debugging keymaps, feel free to change to your liking!
                {
                    '<F5>',
                    function()
                        require('dap').continue()
                    end,
                    desc = 'Debug: Start/Continue',
                },
                {
                    '<F1>',
                    function()
                        require('dap').step_into()
                    end,
                    desc = 'Debug: Step Into',
                },
                {
                    '<F2>',
                    function()
                        require('dap').step_over()
                    end,
                    desc = 'Debug: Step Over',
                },
                {
                    '<F3>',
                    function()
                        require('dap').step_out()
                    end,
                    desc = 'Debug: Step Out',
                },
                {
                    '<leader>b',
                    function()
                        require('dap').toggle_breakpoint()
                    end,
                    desc = 'Debug: Toggle Breakpoint',
                },
                {
                    '<leader>B',
                    function()
                        require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
                    end,
                    desc = 'Debug: Set Breakpoint',
                },
                -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
                {
                    '<F7>',
                    function()
                        require('dapui').toggle()
                    end,
                    desc = 'Debug: See last session result.',
                },
            },
            config = function()
                local dap = require('dap')
                local dapui = require('dapui')

                require('mason-nvim-dap').setup({
                    -- Makes a best effort to setup the various debuggers with
                    -- reasonable debug configurations
                    automatic_installation = true,

                    -- You can provide additional configuration to the handlers,
                    -- see mason-nvim-dap README for more information
                    handlers = {},

                    -- You'll need to check that you have the required things installed
                    -- online, please don't ask me how to install them :)
                    ensure_installed = {
                        -- Update this to ensure that you have the debuggers for the langs you want
                        'delve',
                    },
                })

                -- Dap UI setup
                -- For more information, see |:help nvim-dap-ui|
                ---@diagnostic disable-next-line: missing-fields
                dapui.setup({
                    -- Set icons to characters that are more likely to work in every terminal.
                    --    Feel free to remove or use ones that you like more! :)
                    --    Don't feel like these are good choices.
                    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
                    ---@diagnostic disable-next-line: missing-fields
                    controls = {
                        icons = {
                            pause = '⏸',
                            play = '▶',
                            step_into = '⏎',
                            step_over = '⏭',
                            step_out = '⏮',
                            step_back = 'b',
                            run_last = '▶▶',
                            terminate = '⏹',
                            disconnect = '⏏',
                        },
                    },
                })

                -- Change breakpoint icons
                -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
                -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
                -- local breakpoint_icons = vim.g.have_nerd_font
                --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
                --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
                -- for type, icon in pairs(breakpoint_icons) do
                --   local tp = 'Dap' .. type
                --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
                --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
                -- end

                dap.listeners.after.event_initialized['dapui_config'] = dapui.open
                dap.listeners.before.event_terminated['dapui_config'] = dapui.close
                dap.listeners.before.event_exited['dapui_config'] = dapui.close

                -- Install golang specific config
                require('dap-go').setup({
                    delve = {
                        -- On Windows delve must be run attached or it crashes.
                        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
                        detached = vim.fn.has('win32') == 0,
                    },
                })
            end,
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
})
