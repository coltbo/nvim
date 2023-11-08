local map = vim.keymap.set
local opts = { silent = true, remap = true }

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

map("n", "[c", function()
  require("treesitter-context").go_to_context()
end, opts)
