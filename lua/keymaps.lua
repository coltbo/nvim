local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local builtin = require("telescope.builtin")
local dap = require("dap")

vim.g.mapleader = ','

map('n', "<C-r>", "<cmd>luafile %<cr>", opts)

-- {{{ telescope
map('n', '<leader>ff', builtin.find_files, opts)
map('n', '<leader>fg', builtin.live_grep, opts)
map('n', '<leader>fb', builtin.buffers, opts)
map('n', '<leader>fh', builtin.help_tags, opts)
map('n', '<leader>fo', builtin.lsp_document_symbols, opts)
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts)
map('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>', opts)
-- }}}

-- {{{ tabbing 
map("n", "<A-t>", "<cmd>tabnew<cr>", opts)
map("n", "<A-,>", "<cmd>tabprev<cr>", opts)
map("n", "<A-.>", "<cmd>tabnext<cr>", opts)
-- }}}

-- {{{ dap 
map("n", "<F5>", dap.continue, opts)
map("n", "<F10>", dap.step_over, opts)
map("n", "<F11>", dap.step_into, opts)
map("n", "<F12>", dap.step_out, opts)
map("n", "<C-b>", dap.toggle_breakpoint, opts)
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
