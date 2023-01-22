local builtin = require("telescope.builtin")

require("telescope").setup {
  extensions = {
    file_browser = {
      hijack_netrw = true,
    }
  }
}
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("file_browser")

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Search Help tags" })
vim.keymap.set('n', '<leader>fo', builtin.lsp_document_symbols, { desc = "Symbol browser" })
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = "Keymap browser" })
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>', { desc = "Colorscheme browser"})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', { desc = "File browser"})
