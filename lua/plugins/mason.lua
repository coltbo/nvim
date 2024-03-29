local on_attach = function(client, bufnr)
  local map = vim.keymap.set
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  map('n', '<space>k', vim.lsp.buf.hover, { buffer = bufnr, desc = "Show documentation" })
  map('n', '<S-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Show signature help" })
  map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = "Add workspace folder" })
  map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
    { buffer = bufnr, desc = "Remove workspace folder" })
  map('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr, desc = "List workspace folders" })
  map('n', '<S-d>', vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Show type definition" })
  map('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
  map('n', '<leader>c', vim.lsp.buf.code_action, { buffer = bufnr, desc = "Show code actions" })
  map('n', '<space>f', function() vim.lsp.buf.format { async = true } end,
    { buffer = bufnr, desc = "Format document" })
  map('n', '<space>e', vim.diagnostic.open_float, { desc = "Show diagnostics" })
  map('n', '[d', vim.diagnostic.goto_prev, { desc = "Goto next diagnostic" })
  map('n', ']d', vim.diagnostic.goto_next, { desc = "Goto previous diagnostic" })
  map('n', '<space>q', vim.diagnostic.setloclist, { desc = "Add buffer diagnostics to the location list" })
end

return {
  {
    "mfussenegger/nvim-dap",
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
  },
  "jay-babu/mason-nvim-dap.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" }
      })
    end
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",
  {
    "L3MON4D3/LuaSnip",
    opts = {
      history = false
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip"
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      require("mason").setup()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          lspconfig[server_name].setup {
            root_dir = function(filename, bufnr)
              return vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1])
            end,
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end,
      }

      lspconfig.ocamllsp.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        enabled = function()
          local context = require 'cmp.config.context'

          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
          end
        end,
        mapping = {
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        })
      })
    end
  }
}
