return {
  -- {{{ ui
  "nvim-tree/nvim-web-devicons",
  {
    'rebelot/kanagawa.nvim',
    opts = {
      background = {
        dark = "dragon",
        light = "lotus"
      }
    }
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
