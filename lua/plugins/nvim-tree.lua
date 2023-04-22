return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function ()
    vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTreeToggle"})
    require("nvim-tree").setup {}
  end
}
