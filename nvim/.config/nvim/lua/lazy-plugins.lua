-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.

-- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
-- Or use telescope!
-- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
-- you can continue same window with `<space>sr` which resumes last telescope search

require('lazy').setup({
    spec = { -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
        -- NOTE: Plugins can also be added by using a table,
        -- with the first argument being the link and the following keys can be used to configure plugin behavior/loading/etc.
        --
        -- Use `opts = {}` to force a plugin to be loaded.
        --
        -- modular approach: using `require 'path/name'` will
        --
        -- include a plugin definition from file lua/path/name.lua
        --
        -- Pick which colorscheme here
        -- require 'plugins.colorscheme',

        -- [Random Misc]
        { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically

        { import = 'plugins' },
        -- Git signs in the gutter
        -- require 'plugins.gitsigns',
        -- Keymap hint popup
        -- require 'plugins.which-key',
        -- Highlights todo comments and maybe some other stuff idrk
        -- require 'plugins.todo-comments',
        -- Various small plugins, surround, extra keymaps, etc.
        -- require 'plugins.mini',
        -- Add indent lines even on blank lines
        -- require 'plugins.indent_line',
        -- Auto pair stuff
        -- require 'plugins.autopairs',

        -- File viewer "\" keymap
        -- require 'plugins.neo-tree',
        -- Fuzzy finder and move around files
        -- require 'plugins.telescope',

        -- lspconfig plugin, mason, and configuration for other language servers
        -- require 'plugins.lspconfig',
        -- Formatting
        -- require 'plugins.conform',
        -- Autocomplete
        -- require 'plugins.cmp',
        -- Syntax highlighting
        -- require 'plugins.treesitter',
        -- Linter by filetype and the autocommand to make it work
        -- require 'plugins.lint',

        -- Dap plugins, haven't really gotten there.
        -- require 'plugins.debug',

        -- Markdown Plugins
        -- markdown-render,
        -- require 'plugins.markdown',
        -- require 'plugins.obsidian',

        -- bunch o shit
        -- require 'plugins.telekasten',
    },
    ui = {
        -- backdrop = 100,
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

-- require('lazy').setup(plugins, ui)
