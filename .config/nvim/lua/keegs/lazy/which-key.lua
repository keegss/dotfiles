return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        triggers_blacklist = {},
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show()
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register({
            ["<leader>c"] = { name = "code" },
            ["<leader>f"] = { name = "find" },
        })
    end,
}
