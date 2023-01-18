local opts = { noremap = true, silent = true }
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  hidden = true })

require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  insert_mappings = true,
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

function _lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<cr>", opts)
