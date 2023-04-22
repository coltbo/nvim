local map = vim.keymap.set
local opts = { silent = true, remap = true }

-- {{{ window navigation
map('n', '<C-h>', '<cmd>wincmd h<cr>', opts)
map('n', '<C-j>', '<cmd>wincmd j<cr>', opts)
map('n', '<C-k>', '<cmd>wincmd k<cr>', opts)
map('n', '<C-l>', '<cmd>wincmd l<cr>', opts)
-- }}}

-- {{{ tabs 
map('n', '<leader>tn', '<cmd>tabnew<cr>', opts)
map('n', '<leader>nt', '<cmd>tabnext<cr>', opts)
map('n', '<leader>pt', '<cmd>tabprevious<cr>', opts)
-- }}}

-- {{{ terminal
-- map('n', '<C-`>', '<cmd>split | term<cr>', opts)
vim.cmd[[tnoremap <Esc> <C-\><C-n>]]
-- }}}
