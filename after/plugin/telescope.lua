local opts = { noremap = true, silent = true }
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

vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
-- map('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>fo', builtin.lsp_document_symbols, opts)
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts)
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>', opts)
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', opts)
