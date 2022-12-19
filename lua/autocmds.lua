-- set no numbers for terminals
vim.api.nvim_create_autocmd(
  "TermOpen",
  { pattern = "term://*", command = "setlocal nonumber norelativenumber" }
)

-- set formatting options for new buffers
vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead", "BufEnter" },
  { pattern = "*", command = "set formatoptions-=c formatoptions-=r formatoptions-=o" }
)

-- set toggleterm keymaps
vim.api.nvim_create_autocmd(
  "TermOpen",
  { pattern = "term://*", command = "lua set_terminal_keymaps()" }
)
