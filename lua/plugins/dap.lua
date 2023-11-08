return {
  "mfussenegger/nvim-dap",
  keys = {
    { 'db', "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "DAP toggle breakpoint" },
    { 'dc', "<cmd>lua require('dap').continue()<cr>", desc = "DAP continue" },
    -- { 'di', "<cmd>lua require('dap').step_into()<cr>", desc = "DAP step into" },
    -- { 'do', "<cmd>lua require('dap').step_over()<cr>", desc = "DAP step over" },
    -- { 'dr', "<cmd>lua require('dap').repl.open()<cr>", desc = "DAP open REPL" },
  },
  config = function()
    local dap = require('dap')
    local widgets = require('dap.ui.widgets')
    -- keymaps
    -- vim.keymap.set('n', 'db', "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "DAP toggle breakpoint" })
    -- vim.keymap.set('n', 'dc', "<cmd>lua require('dap').continue()<cr>", { desc = "DAP continue" })
    vim.keymap.set('n', 'di', "<cmd>lua require('dap').step_into()<cr>", { desc = "DAP step into" })
    vim.keymap.set('n', 'do', "<cmd>lua require('dap').step_over()<cr>", { desc = "DAP step over" })
    vim.keymap.set('n', 'dr', "<cmd>lua require('dap').repl.open()<cr>", { desc = "DAP open REPL" })

    vim.keymap.set('n', 'ds', function()
      widgets.sidebar(widgets.scopes).open()
    end, { desc = "DAP open scopes" })

    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        command = '/home/colten/.local/share/nvim/mason/bin/codelldb',
        args = { "--port", "${port}" },
      }
    }

    dap.configurations = {
      c = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        }
      },
      cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        }
      },
    }
  end
}
