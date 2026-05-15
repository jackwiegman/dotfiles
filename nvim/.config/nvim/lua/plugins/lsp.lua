-------------------------------------------------------------------------------------------
--- [[ LSP ]] ----------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- LSP servers must be installed via your system package manager.
-- e.g. on Arch: lua-language-server, clangd, pyright, rust-analyzer
return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'folke/lazydev.nvim',
                ft = 'lua',
                opts = {
                    library = {
                        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                    },
                },
            },
        },
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(
                            mode,
                            keys,
                            func,
                            { buffer = event.buf, desc = 'LSP: ' .. desc }
                        )
                    end

                    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map('gra', vim.lsp.buf.code_action, 'Code [A]ction', { 'n', 'x' })
                    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                    map('grr', vim.lsp.buf.references, '[G]oto [R]eferences')
                    map('gri', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                    map('grt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')
                    map('K', vim.lsp.buf.hover, 'Hover Documentation')

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

                    if client and client:supports_method('textDocument/inlayHint', event.buf) then
                        map('<leader>th', function()
                            vim.lsp.inlay_hint.enable(
                                not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
                            )
                        end, '[T]oggle Inlay [H]ints')
                    end
                end,
            })

            vim.lsp.config('lua_ls', {
                on_init = function(client)
                    client.server_capabilities.documentFormattingProvider = false
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
                settings = {
                    Lua = {
                        format = { enable = false },
                    },
                },
            })
            vim.lsp.enable('lua_ls')

            vim.lsp.config('clangd', {
                cmd = { 'clangd', '--background-index', '--clang-tidy' },
            })
            vim.lsp.enable('clangd')

            vim.lsp.config('taplo', {
                cmd = { 'taplo', 'lsp', 'stdio' },
            })
            vim.lsp.enable('taplo')

            vim.lsp.config('jsonls', {
                cmd = { 'vscode-json-language-server', '--stdio' },
                settings = {
                    json = { validate = { enable = true } },
                },
            })
            vim.lsp.enable('jsonls')

            vim.lsp.config('yamlls', {
                cmd = { 'yaml-language-server', '--stdio' },
                settings = {
                    yaml = { schemaStore = { enable = true } },
                },
            })
            vim.lsp.enable('yamlls')

            vim.lsp.config('texlab', {
                settings = {
                    texlab = {
                        build = {
                            executable = 'latexmk',
                            args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
                            onSave = false,
                        },
                        forwardSearch = {
                            executable = 'zathura',
                            args = { '--synctex-forward', '%l:1:%f', '%p' },
                        },
                    },
                },
            })
            vim.lsp.enable('texlab')

            vim.lsp.config('pyright', {
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = 'openFilesOnly',
                        },
                    },
                },
            })
            vim.lsp.enable('pyright')
        end,
    },
}
