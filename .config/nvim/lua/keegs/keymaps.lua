local map = vim.keymap.set

-- NAVIGATION
-- switch between buffers
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })

-- switch between tabs (bufferline) with ctrl+shift+[ and ctrl+shift+]
map("n", "<C-S-[>", ":bprevious<CR>", { desc = "Previous tab" })
map("n", "<C-S-]>", ":bnext<CR>", { desc = "Next tab" })

-- splits
map("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>s", ":split<CR>", { desc = "Horizontal split" })

-- pane navigation
map("n", "<leader>h", "<C-w>h", { desc = "Focus left pane" })
map("n", "<leader>j", "<C-w>j", { desc = "Focus below pane" })
map("n", "<leader>k", "<C-w>k", { desc = "Focus above pane" })
map("n", "<leader>l", "<C-w>l", { desc = "Focus right pane" })

-- NICE TO HAVE
map("n", "<leader>w", ":w!<CR>", { desc = "Save" })
map("n", "<leader>q", ":q!<CR>", { desc = "Quit" })
map("n", "<leader>x", ":x!<CR>", { desc = "Save and quit" })

-- diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- code actions
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- find file (telescope)
map("n", "<leader>f", function() require("telescope.builtin").find_files() end, { desc = "Find file" })

-- format
map("n", "<leader>p", function() vim.lsp.buf.format() end, { desc = "Format document" })

-- hover definition
map("n", "gh", vim.lsp.buf.hover, { desc = "Hover definition" })

-- TERMINAL MODE
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- VISUAL MODE
-- stay in visual mode while indenting
map("v", "<", "<gv", { desc = "Outdent and reselect" })
map("v", ">", ">gv", { desc = "Indent and reselect" })

-- move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- toggle comment
map("v", "<leader>c", "gc", { remap = true, desc = "Toggle comment" })
