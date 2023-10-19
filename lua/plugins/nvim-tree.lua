return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Open nvim-tree"}
  },
  lazy = true,
  config = function ()
    require("nvim-tree").setup()
  end
}
