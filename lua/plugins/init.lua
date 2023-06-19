return {
  -- {{{ utilities
  "nvim-telescope/telescope.nvim",
  -- }}}

  -- {{{ ui
  "nvim-tree/nvim-web-devicons",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end
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
        "gitsigns",
        "nvim-cmp",
        "nvim-tree",
        "nvim-web-devicons",
        "telescope",
        "which-key"
      }
    }
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
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
