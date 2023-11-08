return {
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
  -- }}}

  -- {{{ Git
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("gitsigns").setup()
    end
  },
  -- }}}

  -- {{{ Utils
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  }
  -- }}}
}
