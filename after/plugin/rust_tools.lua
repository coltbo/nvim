local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>rdb", "<cmd>RustDebuggables<cr>", opts)
vim.keymap.set("n", "<leader>rr", "<cmd>RustRunnables<cr>", opts)
