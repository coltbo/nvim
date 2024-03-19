return {
  "nvim-tree/nvim-web-devicons",
  "rktjmp/lush.nvim",

  -- {{{ colorschemes
  {
    "mcchrish/zenbones.nvim",
    name = "zenbones"
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        }
      }
    end
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        background = {
          dark = "dragon",
          light = "lotus"
        }
      })
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
      })
    end
  }
  -- }}}
}
