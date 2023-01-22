local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = "Undotree toggle" })
