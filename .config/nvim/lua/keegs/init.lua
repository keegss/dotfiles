vim.g.mapleader = " " -- Set leader key before Lazy

require("keegs.lazy_init")
require("keegs.keymaps")

vim.cmd[[colorscheme tokyonight]]

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'

local function osc52_copy(lines, _)
  local data = table.concat(lines, '\n')
  local b64 = vim.fn.system('base64 | tr -d "\n"', data)
  io.stderr:write('\x1b]52;c;' .. b64 .. '\x1b\\')
end

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = osc52_copy,
    ['*'] = osc52_copy,
  },
  paste = {
    ['+'] = function() return { vim.fn.getreg('') } end,
    ['*'] = function() return { vim.fn.getreg('') } end,
  },
}
