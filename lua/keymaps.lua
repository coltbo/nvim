local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

-- {{{ tabbing
vim.keymap.set("n", "<A-t>", "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "<A-,>", "<cmd>tabprev<cr>", { desc = "Goto previous tab" })
vim.keymap.set("n", "<A-.>", "<cmd>tabnext<cr>", { desc = "Goto next tab" })
-- }}}

-- {{{ buffers 
vim.keymap.set("n", "<leader>vs", "<cmd>vs<cr>", {desc = "Virtical split"})
vim.keymap.set("n", "<leader>hs", "<cmd>split<cr>", {desc = "Horizontal split"})
-- }}}
