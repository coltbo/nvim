return {
  "tpope/vim-commentary",
  "nvim-lua/plenary.nvim",
  "BurntSushi/ripgrep",
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<C-\>]]
    }
  },
}
