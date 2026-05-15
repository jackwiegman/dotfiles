-------------------------------------------------------------------------------------------
--- [[ Formatting ]] ---------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Formatters must be installed via your system package manager.
-- e.g. stylua, clang-format, black
return {
    {
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
            format_on_save = false,
            -- format_on_save = function(bufnr)
            --     local enabled = { lua = true, python = true, c = true, cpp = true }
            --     if enabled[vim.bo[bufnr].filetype] then
            --         return { timeout_ms = 500 }
            --     end
            -- end,
            default_format_opts = {
                lsp_format = 'fallback',
            },
            formatters_by_ft = {
                lua = { 'stylua' },
                c = { 'clang-format' },
                cpp = { 'clang-format' },
                python = { 'black' },
                json = { 'jq' },
                xml = { 'xmllint' },
                toml = { 'taplo' },
                tex = { 'latexindent' },
                markdown = { 'mdformat', 'markdownlint-cli2' },
            },
            formatters = {
                stylua = {
                    prepend_args = function(_, ctx)
                        return { '--indent-width', vim.bo[ctx.buf].shiftwidth, '--indent-type', 'Spaces' }
                    end,
                },
                mdformat = {
                    prepend_args = { '--wrap', '80' },
                },
            },
        },
    },
}
