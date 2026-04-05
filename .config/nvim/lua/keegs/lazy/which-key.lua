return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        delay = 300,
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add({
            { "<leader>c", group = "code" },
            { "<leader>f", group = "find" },
        })
    end,
}
