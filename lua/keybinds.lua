local map = vim.keymap.set
local opts = { silent = true, remap = true }

-- {{{ go to alpha dashboard 
map("n", "<C-a>", "<cmd>Alpha<cr>", opts)
-- }}}

-- {{{ window navigation
map("n", "<C-h>", "<cmd>wincmd h<cr>", opts)
map("n", "<C-j>", "<cmd>wincmd j<cr>", opts)
map("n", "<C-k>", "<cmd>wincmd k<cr>", opts)
map("n", "<C-l>", "<cmd>wincmd l<cr>", opts)
-- }}}

-- {{{ tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", opts)
map("n", "<A-.>", "<cmd>tabnext<cr>", opts)
map("n", "<A-,>", "<cmd>tabprevious<cr>", opts)
-- }}}

-- {{{ trouble
-- Lua
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
-- }}}

-- {{{ nvim-tree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTreeToggle"})
-- }}}

-- {{{ terminal
-- map('n', '<leader>t', "<cmd>ToggleTerm<cr>", opts)
vim.cmd [[tnoremap <Esc> <C-\><C-n>]]
-- }}}
