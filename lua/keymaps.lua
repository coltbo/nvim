local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

-- {{{ tabbing 
vim.keymap.set("n", "<A-t>", "<cmd>tabnew<cr>", opts)
vim.keymap.set("n", "<A-,>", "<cmd>tabprev<cr>", opts)
vim.keymap.set("n", "<A-.>", "<cmd>tabnext<cr>", opts)
-- }}}
