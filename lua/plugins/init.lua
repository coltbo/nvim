return {
  "tpope/vim-commentary",
  "nvim-lua/plenary.nvim",
  "BurntSushi/ripgrep",
  -- {{{ colorschemes
  "rktjmp/lush.nvim",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },
  -- }}}
  "tpope/vim-fugitive",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
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
        }
      }

      -- dap.configurations.rust = dap.configurations.cpp
    end
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").setup {
        history = false
      }
    end
  },
  "nvim-tree/nvim-web-devicons",
  {
    "tjdevries/express_line.nvim",
    config = function()
      require("el").setup {}
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<C-`>]]
    }
  }
}
