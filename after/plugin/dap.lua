local opts = { noremap = true, silent = true }
local dap = require("dap")

require("nvim-dap-virtual-text").setup {}

vim.keymap.set("n", "<F5>", dap.continue, opts)
vim.keymap.set("n", "<F10>", dap.step_over, opts)
vim.keymap.set("n", "<F11>", dap.step_into, opts)
vim.keymap.set("n", "<F12>", dap.step_out, opts)
vim.keymap.set("n", "<C-b>", dap.toggle_breakpoint, opts)
vim.keymap.set("n", "<C-S-b>", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
