local dap = require("dap")
local dapui = require("dapui")

local opts = { noremap=true, silent=true }

local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  if client.config.root_dir ~= nil then
    vim.api.nvim_set_current_dir(client.config.root_dir)
  else
    vim.ui.input({ prompt = "Enter value for root directory: "}, function(input)
      vim.api.nvim_set_current_dir(input)
    end)
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = "Goto declaration"})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Goto definition" })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = "Goto implementation" })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = "Show documentation" })
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Show signature help" })
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = "Add workspace folder" })
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { buffer = bufnr, desc = "Remove workspace folder" })
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr, desc = "List workspace folders" })
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Show type definition" })
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = "Show code actions" })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = "List references" })
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, { buffer = bufnr, desc = "Format document" })
end

-- {{{ mason setup 
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function (server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
}

-- {{{ dap config 
dapui.setup {}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
-- }}}

require("mason-nvim-dap").setup({
  automatic_setup = true
})

require("mason-nvim-dap").setup_handlers {
  function (source_name)
    require("mason-nvim-dap.automatic_setup")(source_name)
  end,
  -- codelldb = function(source_name)
  --   dap.adapters.lldb = {
  --     type = "executable",
  --     command = "/usr/bin/lldb-vscode",
  --     name = "lldb"
  --   }

  --   dap.configurations.cpp = {
  --     {
  --       name = "Launch",
  --       type = 'lldb',
  --       request = 'launch',
  --       program = function()
  --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  --       end,
  --       cwd = "${workspaceFolder}",
  --       stopOnEntry = false,
  --       args = {},
  --     }
  --   }

  --   dap.configurations.c = dap.configurations.cpp
  --   dap.configurations.rust = dap.configurations.cpp
  -- end,
}
-- }}}

-- Add additional capabilities supported by nvim-cmp
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Show diagnostics"})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Goto next diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Goto previous diagnostic" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Add buffer diagnostics to the location list" })

-- luasnip setup
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }), {
    { name = 'buffer' },
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
