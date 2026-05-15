return {
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            indent = { char = '│' },
            scope = { enabled = true },
        },
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'gruvbox',
            },
        },
    },

    {
        'folke/trouble.nvim',
        cmd = 'Trouble',
        keys = {
            { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
            { '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
            { '<leader>xs', '<cmd>Trouble symbols toggle<cr>', desc = 'Symbols (Trouble)' },
            { '<leader>xq', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix (Trouble)' },
            { '<leader>xt', '<cmd>Trouble todo toggle<cr>', desc = 'Todo (Trouble)' },
        },
        opts = {},
    },

    { 'tpope/vim-repeat', event = 'VeryLazy' },

    {
        'kdheepak/lazygit.nvim',
        cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitFilter' },
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
        },
    },
}
