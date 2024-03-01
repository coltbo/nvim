local map = vim.keymap.set
local opts = { silent = true, remap = true }

-- {{{ dap
map('n', 'ds', function() require('dap').step_over() end)
map('n', 'di', function() require('dap').step_into() end)
map('n', 'do', function() require('dap').step_out() end)
map('n', '<Leader>B', function() require('dap').toggle_breakpoint() end)
map('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
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

map('n', "<S-Up>", "<cmd>winc k<cr>", { desc = "Move up" })
map('n', "<S-Down>", "<cmd>winc j<cr>", { desc = "Move down" })
map('n', "<S-Left>", "<cmd>winc h<cr>", { desc = "Move left" })
map('n', "<S-Right>", "<cmd>winc l<cr>", { desc = "Move right" })
