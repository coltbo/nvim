-- setup lazy
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

vim.g.mapleader = ","

require("lazy").setup("plugins")
require('keybinds')
require('lsp')

-- {{{ options
-- Visual
vim.o.pumheight     = 10
vim.o.termguicolors = true -- Use true colors, required for some plugins
vim.o.wrap          = true
vim.o.rnu           = true -- Relative numbers
vim.o.number        = true -- numbers
vim.wo.cursorline   = true
vim.o.background    = "dark"

-- Behaviour
vim.o.hlsearch     = false
vim.o.ignorecase   = true -- Ignore case when using lowercase in search
vim.o.smartcase    = true -- But don't ignore it when using upper case
vim.o.smarttab     = true
vim.o.smartindent  = true
vim.o.expandtab    = true -- Convert tabs to spaces.
vim.o.tabstop      = 2
vim.o.softtabstop  = 2
vim.o.shiftwidth   = 2
vim.o.mouse        = 'a'

-- Vim specific
vim.o.hidden       = true -- Do not save when switching buffers
vim.o.fileencoding = "utf-8"
vim.o.spell        = true
vim.o.spelllang    = "en_us"
vim.o.completeopt  = "menuone,noinsert,noselect"
vim.o.wildmode     = "longest,full" -- Display auto-complete in Command Mode
vim.o.timeout      = true
vim.o.timeoutlen   = 300
-- }}}

-- }}}

vim.cmd.colorscheme("material")
