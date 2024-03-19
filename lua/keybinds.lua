local map = vim.keymap.set
local opts = { silent = true, remap = true }

-- {{{ dap
map('n', '<F8>', function() require('dap').continue() end)
map('n', '<F6>', function() require('dap').step_over() end)
map('n', '<F5>', function() require('dap').step_into() end)
map('n', '<F7>', function() require('dap').step_out() end)
map('n', '<leader>B', function() require('dap').toggle_breakpoint() end)
map('n', '<Leader>dr', function() require('dap').repl.open() end)
map('n', '<Leader>dl', function() require('dap').run_last() end)
map({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
map({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
map('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
map('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
-- }}}

map("n", "[c", function()
  require("treesitter-context").go_to_context()
end, opts)

map("n", "ex", "<cmd>Explore<cr>", opts)

-- {{{ window moving
map('n', "<S-Up>", "<cmd>winc k<cr>", { desc = "Move up" })
map('n', "<S-Down>", "<cmd>winc j<cr>", { desc = "Move down" })
map('n', "<S-Left>", "<cmd>winc h<cr>", { desc = "Move left" })
map('n', "<S-Right>", "<cmd>winc l<cr>", { desc = "Move right" })
-- }}}

-- {{{ compiling
map('n', '<leader>cc', '<cmd>make<cr>', { desc = "Compile" })
map('n', '<leader>co', '<cmd>copen<cr>', { desc = "Open compile errors" })
map('n', '<leader>cn', '<cmd>cnext<cr>', { desc = "Open compile errors" })
map('n', '<leader>cp', '<cmd>cprevious<cr>', { desc = "Open compile errors" })
-- }}}
