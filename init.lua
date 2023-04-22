local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ","

require("lazy").setup("plugins")

-- {{{ options
-- Visual
vim.o.conceallevel  = 0 -- Don't hide quotes in markdown
vim.o.cmdheight     = 1
vim.o.pumheight     = 10
vim.o.showmode      = false
vim.o.showtabline   = 2    -- Always show tabline
vim.o.title         = true
vim.o.termguicolors = true -- Use true colors, required for some plugins
vim.o.wrap          = true
vim.o.rnu           = true
vim.wo.cursorline   = true

-- Behaviour
vim.o.hlsearch      = false
vim.o.ignorecase    = true -- Ignore case when using lowercase in search
vim.o.smartcase     = true -- But don't ignore it when using upper case
vim.o.smarttab      = true
vim.o.smartindent   = true
vim.o.expandtab     = true -- Convert tabs to spaces.
vim.o.tabstop       = 2
vim.o.softtabstop   = 2
vim.o.shiftwidth    = 2
vim.o.splitbelow    = true
vim.o.splitright    = true
vim.o.scrolloff     = 12 -- Minimum offset in lines to screen borders
vim.o.sidescrolloff = 8
vim.o.mouse         = 'a'


-- Vim specific
-- vim.o.hidden       = true -- Do not save when switching buffers
-- vim.o.fileencoding = "utf-8"
-- vim.o.spell        = false
-- vim.o.spelllang    = "en_us"
-- vim.o.completeopt  = "menuone,noinsert,noselect"
-- vim.o.wildmode     = "longest,full" -- Display auto-complete in Command Mode
-- }}}

vim.opt.guifont    = { "JetBrainsMono Nerd Font", "h12" }
-- }}}

-- {{{ autocmds
vim.api.nvim_create_autocmd(
  "TermOpen",
  {
    pattern = "*",
    command = "setlocal nonumber norelativenumber | startinsert | resize 15",
  }
)
-- }}}

vim.cmd [[colorscheme catppuccin]]
vim.o.background = "dark"

require('keybinds')
