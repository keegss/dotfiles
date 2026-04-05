return {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('gitsigns').setup({
            signs = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local map = function(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                -- navigation
                map('n', ']c', gs.next_hunk, 'Next hunk')
                map('n', '[c', gs.prev_hunk, 'Prev hunk')

                -- actions
                map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
                map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
                map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
                map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Blame line')
            end,
        })
    end,
}
