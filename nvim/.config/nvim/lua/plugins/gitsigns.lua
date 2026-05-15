-------------------------------------------------------------------------------------------
--- [[ Gitsigns ]] -----------------------------------------------------------------------
-------------------------------------------------------------------------------------------
return {
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                local gs = require('gitsigns')

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = 'Git: ' .. desc })
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']c', bang = true })
                    else
                        gs.nav_hunk('next')
                    end
                end, 'Next [C]hange')

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ '[c', bang = true })
                    else
                        gs.nav_hunk('prev')
                    end
                end, 'Prev [C]hange')

                -- Actions
                map({ 'n', 'v' }, '<leader>hs', gs.stage_hunk, '[S]tage hunk')
                map({ 'n', 'v' }, '<leader>hr', gs.reset_hunk, '[R]eset hunk')
                map('n', '<leader>hS', gs.stage_buffer, '[S]tage buffer')
                map('n', '<leader>hR', gs.reset_buffer, '[R]eset buffer')
                map('n', '<leader>hp', gs.preview_hunk, '[P]review hunk')
                map('n', '<leader>hi', gs.preview_hunk_inline, 'Preview hunk [I]nline')
                map('n', '<leader>hb', function()
                    gs.blame_line({ full = true })
                end, '[B]lame line')
                map('n', '<leader>hd', gs.diffthis, '[D]iff against index')
                map('n', '<leader>hD', function()
                    gs.diffthis('@')
                end, '[D]iff against last commit')
                map('n', '<leader>hq', gs.setqflist, 'Hunk [Q]uickfix list (current file)')
                map('n', '<leader>hQ', function()
                    gs.setqflist('all')
                end, 'Hunk [Q]uickfix list (all files)')

                -- Toggles
                map('n', '<leader>tb', gs.toggle_current_line_blame, '[T]oggle line [B]lame')
                map('n', '<leader>tw', gs.toggle_word_diff, '[T]oggle [W]ord diff')

                -- Text object
                vim.keymap.set({ 'o', 'x' }, 'ih', gs.select_hunk, { desc = 'Select git hunk' })
            end,
        },
    },
}
