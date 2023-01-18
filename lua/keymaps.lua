local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

vim.keymap.set('n', "<C-r>", "<cmd>luafile %<cr>", opts)

-- {{{ tabbing 
vim.keymap.set("n", "<A-t>", "<cmd>tabnew<cr>", opts)
vim.keymap.set("n", "<A-,>", "<cmd>tabprev<cr>", opts)
vim.keymap.set("n", "<A-.>", "<cmd>tabnext<cr>", opts)
-- }}}

-- {{{ dap-ui
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dapui').open()<cr>", opts)
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dapui').close()<cr>", opts)
vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", opts)
-- }}}

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

