return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require('dap')
    local widgets = require('dap.ui.widgets')
    -- keymaps
    vim.keymap.set('n', '<F9>', "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "DAP toggle breakpoint" })
    vim.keymap.set('n', '<F5>', "<cmd>lua require('dap').continue()<cr>", { desc = "DAP continue" })
    vim.keymap.set('n', '<F11>', "<cmd>lua require('dap').step_into()<cr>", { desc = "DAP step into" })
    vim.keymap.set('n', '<F10>', "<cmd>lua require('dap').step_over()<cr>", { desc = "DAP step over" })
    vim.keymap.set('n', '<leader>dr', "<cmd>lua require('dap').repl.open()<cr>", { desc = "DAP open REPL" })

    vim.keymap.set('n', '<leader>sc', function()
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

    dap.adapters.coreclr = {
      type = "executable",
      command = "C:/Users/K90008871/AppData/Local/nvim-data/mason/bin/netcoredbg.cmd",
      args = { "--interpreter=vscode" }
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
      cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "\\bin\\Debug", "file")
          end
        }
      }
    }
  end
}
