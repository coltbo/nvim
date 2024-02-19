local map = vim.keymap.set
local opts = { silent = true, remap = true }

map("n", "[c", function()
  require("treesitter-context").go_to_context()
end, opts)

map("n", "ex", "<cmd>Explore<cr>", opts)

map('n', '<space>e', vim.diagnostic.open_float, { desc = "Show diagnostics" })
map('n', '[d', vim.diagnostic.goto_prev, { desc = "Goto next diagnostic" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "Goto previous diagnostic" })
map('n', '<space>q', vim.diagnostic.setloclist, { desc = "Add buffer diagnostics to the location list" })
