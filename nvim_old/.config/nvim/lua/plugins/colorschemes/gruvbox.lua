return {
    {
        'ellisonleao/gruvbox.nvim',
        opts = {
            -- contrast = 'soft',
            contrast = 'medium',
            -- contrast = 'hard',
            dim_inactive = 'true',
            -- transparent_mode = 'true',
        },
        init = function()
            -- vim.cmd('colorscheme gruvbox')
            vim.cmd.colorscheme('gruvbox')
            -- vim.o.background = 'light'
            vim.o.background = 'dark'
            -- vim.o.background = 'transparent'
        end,
    },
}
