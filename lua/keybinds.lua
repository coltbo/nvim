local map = vim.keymap.set
local opts = { silent = true, remap = true }

-- {{{ window navigation
map("n", "<C-h>", "<cmd>wincmd h<cr>", opts)
map("n", "<C-j>", "<cmd>wincmd j<cr>", opts)
map("n", "<C-k>", "<cmd>wincmd k<cr>", opts)
map("n", "<C-l>", "<cmd>wincmd l<cr>", opts)
-- }}}

-- {{{ trouble
-- Lua
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
-- }}}

-- {{{ tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", opts)
map("n", "<A-.>", "<cmd>tabnext<cr>", opts)
map("n", "<A-,>", "<cmd>tabprevious<cr>", opts)
-- }}}

-- {{{ terminal
-- map('n', '<leader>t', "<cmd>ToggleTerm<cr>", opts)
vim.cmd [[tnoremap <Esc> <C-\><C-n>]]
-- }}}

map("n", "[c", function()
  require("treesitter-context").go_to_context()
end, opts)
