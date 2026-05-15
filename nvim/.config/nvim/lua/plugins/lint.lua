-------------------------------------------------------------------------------------------
--- [[ Linting ]] ------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Linters must be installed via your system package manager:
-- sudo pacman -S cppcheck luacheck ruff markdownlint-cli2
return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            c = { 'cppcheck' },
            cpp = { 'cppcheck' },
            lua = { 'luacheck' },
            python = { 'ruff' },
            tex = { 'chktex' },
            markdown = { 'markdownlint-cli2' },
        }

        lint.linters.luacheck.args =
            vim.list_extend(lint.linters.luacheck.args or {}, { '--globals', 'vim' })

        lint.linters.chktex.ignore_exitcode = true
        lint.linters.chktex.args = vim.list_extend(
            lint.linters.chktex.args or {},
            { '-n44' }
        )

        local markdownlint = lint.linters['markdownlint-cli2']
        markdownlint.args = vim.list_extend(
            { '--config', vim.fn.stdpath('config') .. '/.markdownlint-cli2.yaml' },
            markdownlint.args or {}
        )

        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave', 'BufEnter' }, {
            group = lint_augroup,
            callback = function()
                local bufname = vim.api.nvim_buf_get_name(0)
                if
                    vim.bo.modifiable
                    and vim.bo.buftype == ''
                    and bufname ~= ''
                    and vim.fn.filereadable(bufname) == 1
                then
                    lint.try_lint()
                end
            end,
        })

        vim.keymap.set('n', '<leader>tl', function()
            lint.try_lint()
        end, { desc = '[T]rigger [L]int' })
    end,
},
}
