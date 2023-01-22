local opts = { noremap = true, silent = true }
local dap = require("dap")

require("nvim-dap-virtual-text").setup {}

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<C-b>", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<C-S-b>", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", { desc = "Breakpoint condition" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dapui').open()<cr>", { desc = "Open dapui" })
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dapui').close()<cr>", { desc = "Close dapui" })
vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle dapui" })
