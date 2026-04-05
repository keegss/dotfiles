return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 25,
      direction = "horizontal",
      shade_terminals = true,
      shading_factor = 2,
    })
  end,
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal", mode = "n" },
    { "<C-\\>", "<C-\\><C-n><cmd>ToggleTerm<cr>", desc = "Toggle terminal", mode = "t" },
  },
}
