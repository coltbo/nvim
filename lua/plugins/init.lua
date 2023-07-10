return {
  -- {{{ utilities
  "nvim-telescope/telescope.nvim",
  -- }}}

  -- {{{ ui
  "nvim-tree/nvim-web-devicons",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
    }
  },
  {
    "marko-cerovac/material.nvim",
    opts = {
      styles = {
        comments = {
          italic = true
        },
        keywords = {
          italic = true
        },
        functions = {
          bold = true,
          italic = true
        }
      },
      plugins = {
        "dap",
        "neogit",
        "gitsigns",
        "nvim-cmp",
        "nvim-tree",
        "nvim-web-devicons",
        "telescope",
        "which-key",
        "indent-blankline"
      },
      disable = {
        colored_cursor = true,
      }
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("indent_blankline").setup {
          show_current_context = true,
          show_current_context_start = true,
      }
    end,
  },
  -- }}}

  -- {{{ Git
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("gitsigns").setup()
    end
  },
  -- }}}
}
