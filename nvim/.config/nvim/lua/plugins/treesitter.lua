-------------------------------------------------------------------------------------------
--- [[ Treesitter ]] ---------------------------------------------------------------------
-------------------------------------------------------------------------------------------
return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').install({
                'bash',
                'c',
                'cpp',
                'css',
                'diff',
                'html',
                'json',
                'lua',
                'luadoc',
                'make',
                'markdown',
                'markdown_inline',
                'python',
                'query',
                'regex',
                'rust',
                'sql',
                'toml',
                'typescript',
                'vim',
                'vimdoc',
                'yaml',
            })

            local function treesitter_try_attach(buf, language)
                if not vim.treesitter.language.add(language) then
                    return
                end
                vim.treesitter.start(buf, language)
                local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil
                if has_indent_query then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end

            local available = require('nvim-treesitter').get_available()
            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup('treesitter-attach', { clear = true }),
                callback = function(args)
                    local buf, filetype = args.buf, args.match
                    local language = vim.treesitter.language.get_lang(filetype)
                    if not language then
                        return
                    end

                    local installed = require('nvim-treesitter').get_installed('parsers')
                    if vim.tbl_contains(installed, language) then
                        treesitter_try_attach(buf, language)
                    elseif vim.tbl_contains(available, language) then
                        require('nvim-treesitter').install(language):await(function()
                            treesitter_try_attach(buf, language)
                        end)
                    else
                        treesitter_try_attach(buf, language)
                    end
                end,
            })
        end,
    },
}
