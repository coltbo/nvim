return {
  -- {{{ utilities
  "nvim-telescope/telescope.nvim",
  -- }}}

  -- {{{ ui
  "nvim-tree/nvim-web-devicons",
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
      require('kanagawa').setup({
        theme = "dragon",
        background = {
          dark = "dragon",
          light = "lotus"
        }
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end
  },
  -- }}}

  -- {{{ Git
  {
    "tpope/vim-fugitive",
    lazy = true,
    keys = {
      { "<C-g>", "<cmd>Git<cr>", desc = "Open git" }
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("gitsigns").setup()
    end
  },
  -- }}}
}
