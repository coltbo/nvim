return {
  -- {{{ utilities
  "nvim-telescope/telescope.nvim",
  -- }}}

  -- {{{ ui
  "nvim-tree/nvim-web-devicons",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabed = true
      },
      sections = {
        lualine_c = {'windows'}
      }
    }
  },
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
    'rose-pine/neovim',
    name = 'rose-pine',
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        styles = {
          comments = "italic",
          constants = "bold",
          keywords = "italic",
        }
      }
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
        "gitsigns",
        "nvim-cmp",
        "nvim-tree",
        "nvim-web-devicons",
        "telescope",
        "which-key"
      }
    }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function ()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all notifications"
      },
    },
    opts = {
      timeout = 3000,
    }
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
