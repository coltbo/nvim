return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { '<F8>', function() require('dap').continue() end, desc = 'Continue' },
      { '<leader>B', function() require('dap').toggle_breakpoint() end, desc = 'Toggle breakpoint' },
    },
    config = function()
      local dap = require('dap')
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
      }

      dap.configurations.c = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "${workspaceFolder}",
          stopAtBegginingOfMainSubprogram = false,
        }
      }
    end
  }
}
