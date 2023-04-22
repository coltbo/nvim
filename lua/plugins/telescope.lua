local builtin = require("telescope.builtin")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>ff', builtin.find_files,                { desc = "Find files" } },
    { '<leader>fg', builtin.live_grep,                 { desc = "Live grep" } },
    { '<leader>fh', builtin.help_tags,                 { desc = "Search Help tags" } },
    { '<leader>fo', builtin.lsp_document_symbols,      { desc = "Symbol browser" } },
    { '<leader>fk', '<cmd>Telescope keymaps<cr>',      { desc = "Keymap browser" } },
    { '<leader>fc', '<cmd>Telescope colorscheme<cr>',  { desc = "Colorscheme browser" } },
    { '<leader>fb', '<cmd>Telescope file_browser<cr>', { desc = "File browser" } },
    { '<leader>bb', '<cmd>Telescope buffers<cr>',      { desc = "Buffer browser" } },
  },
  config = function()
    require("telescope").setup {
      extensions = {
        file_browser = {
          hijack_netrw = true,
        }
      }
    }

    require("telescope").load_extension("fzy_native")
    require("telescope").load_extension("file_browser")
  end
}
