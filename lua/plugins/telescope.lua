local utils = require("utils")

return {
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      -- {{{ file searching
      { "<leader>ff", utils.telescope("find_files"),             desc = "Search files" },
      { "<leader>fg", utils.telescope("live_grep"),              desc = "Live grep" },
      { "<leader>bb", "<cmd>Telescope buffers<cr>",              desc = "Search buffer" },
      { "<leader>fb", "<cmd>Telescope file_browser<cr>",         desc = "File browser" },
      -- }}}

      -- {{{ lsp
      { "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find symbol" },
      { "<leader>ca", "<cmd>Telescope quickfix<cr>",             desc = "Search quickfix" },
      { "<leader>gr", "<cmd>Telescope lsp_references<cr>",       desc = "Search references" },
      { "<leader>gi", "<cmd>Telescope lsp_implementations<cr>",  desc = "Search implementations" },
      -- }}}

      -- {{{ vim related
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",            desc = "Search help tags" },
      { "<leader>fd", "<cmd>Telescope commands<cr>",             desc = "Search commands" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>",              desc = "Find keymaps" },
      { "<leader>fc", "<cmd>Telescope colorscheme<cr>",          desc = "Find colorscheme" },
      -- }}}
    },
    config = function()
      require("telescope").setup {
        defaults = {
          prompt_prefix = " ",
        },
        extensions = {
          file_browser = {
            hijack_netrw = true,
          }
        },
        pickers = {
          lsp_references = {
            theme = "dropdown"
          },
          lsp_document_symbols = {
            theme = "dropdown"
          },
          commands = {
            theme = "dropdown"
          },
          quickfix = {
            theme = "ivy"
          }
        }
      }

      require("telescope").load_extension("fzy_native")
      require("telescope").load_extension("file_browser")
    end
  }
}
