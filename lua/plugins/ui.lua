return {
  "nvim-tree/nvim-web-devicons",

  -- {{{ colorschemes 
  {
    "rose-pine/neovim",
    name = "rose-pine"
  },

  {
    'marko-cerovac/material.nvim',
    config = function()
      vim.g.material_style = "darker"
    end
  }

  -- }}}
}
