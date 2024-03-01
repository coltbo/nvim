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

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- {{{ starting language servers
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { "*.c", "*.h", "*.cpp", "*.cc" },
  callback = function(args)
    vim.lsp.start({
      name = 'clangd',
      cmd = { 'clangd', '--clang-tidy' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'makefile', 'CMakeLists.txt' }, { upward = true })[1]),
    })
  end
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { "*.lua" },
  callback = function(args)
    vim.lsp.start({
      name = 'lua-language-server',
      cmd = { 'lua-language-server' },
      root_dir = vim.fs.dirname(vim.fs.find({ '*.git' }, { upward = true })[1]),
    })
  end
})
-- }}}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    on_attach(args.data.client_id, args.buf)
  end,
})
