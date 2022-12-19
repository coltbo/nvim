local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.mapleader = ','

map('n', "<C-r>", "<cmd>luafile %<cr>", opts)

-- {{{ telescope
map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', opts)
map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', opts)
map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', opts)
map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', opts)
map('n', '<leader>fo', '<cmd>lua require(\'telescope.builtin\').lsp_document_symbols()<cr>', opts)
map('n', '<leader>fp', '<cmd>Telescope projects<cr>', opts)
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts)
map('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>', opts)
-- }}}

-- {{{ tabbing 
map("n", "<A-t>", "<cmd>tabnew<cr>", opts)
map("n", "<A-,>", "<cmd>tabprev<cr>", opts)
map("n", "<A-.>", "<cmd>tabnext<cr>", opts)
-- }}}

-- {{{ dap 
map("n", "<F5>", "<cmd>lua require('dap').continue()<cr>", opts)
map("n", "<F10>", "<cmd>lua require('dap').step_over()<cr>", opts)
map("n", "<F11>", "<cmd>lua require('dap').step_into()<cr>", opts)
map("n", "<F12>", "<cmd>lua require('dap').step_out()<cr>", opts)
map("n", "<C-b>", "<cmd>lua require('dap').toggle_breakpoint()<cr>", opts)
map("n", "<C-S-b>", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
-- }}}

-- {{{ rust tools
map("n", "<leader>rdb", "<cmd>RustDebuggables<cr>", opts)
map("n", "<leader>rr", "<cmd>RustRunnables<cr>", opts)
---}}}

-- {{{ dap-ui
map("n", "<leader>do", "<cmd>lua require('dapui').open()<cr>", opts)
map("n", "<leader>dc", "<cmd>lua require('dapui').close()<cr>", opts)
map("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", opts)
-- }}}

-- {{{ toggleterm
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
-- }}}

-- {{{ trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
map("n", "<leader>gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
-- }}}
