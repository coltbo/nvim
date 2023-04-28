-- this code will set the default shell to powershell
-- if we are on a windows system
if vim.loop.os_uname().sysname == "Windows_NT" then
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end

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

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ","

require("lazy").setup("plugins")
require('keybinds')

-- {{{ options
-- Visual
vim.o.conceallevel  = 0 -- Don't hide quotes in markdown
vim.o.cmdheight     = 1
vim.o.pumheight     = 10
vim.o.showmode      = false
vim.o.showtabline   = 1    -- Always show tabline
vim.o.title         = true
vim.o.termguicolors = true -- Use true colors, required for some plugins
vim.o.wrap          = true
vim.o.rnu           = true
vim.wo.cursorline   = true
vim.o.background    = "dark"

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
vim.o.autochdir     = true

-- Vim specific
vim.o.hidden        = true -- Do not save when switching buffers
vim.o.fileencoding  = "utf-8"
vim.o.spell         = false
vim.o.spelllang     = "en_us"
vim.o.completeopt   = "menuone,noinsert,noselect"
vim.o.wildmode      = "longest,full" -- Display auto-complete in Command Mode
vim.notify          = require("notify")
vim.o.timeout       = true
vim.o.timeoutlen    = 300
-- }}}

vim.opt.guifont     = "FiraCode NFM:h11"
-- }}}

-- {{{ autocmds
vim.api.nvim_create_autocmd(
  "TermOpen",
  {
    pattern = "*",
    command = "setlocal nonumber norelativenumber | startinsert",
  }
)
-- }}}

-- {{{ autocmnd to close nvim-tree
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
    end
  end
})
-- }}}

vim.g.material_style = "darker"

vim.cmd.colorscheme("catppuccin")
