return { -- Putting all the markdown plugins and config here
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',

            'echasnovski/mini.nvim', -- if you use the mini.nvim suite
        },
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            indent = {
                enabled = true,
                skip_level = 2,
                icon = '',
            },
            -- completions = { lsp = { enabled = true } }, -- Add completions through lsp, will also do with cmp
            latex = {
                render_modes = { 'n', 'c', 't' },
                top_pad = 1,
                bottom_pad = 1,
            },
            heading = {
                width = 'block',
                right_pad = 2,
            },
        },
    },
}
