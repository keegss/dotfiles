return {
    'akinsho/git-conflict.nvim',
    version = '*',
    event = 'BufReadPre',
    config = function()
        require('git-conflict').setup({
            default_mappings = true,    -- co, ct, cb, c0, ]x, [x
            disable_diagnostics = true, -- less noise during conflict resolution
        })
    end,
}
