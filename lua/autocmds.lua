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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*',
  callback = function()
    print(require('luasnip').session.jump_active)
    if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
      require('luasnip').unlink_current()
    end
  end
})
