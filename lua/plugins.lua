local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
      -- {{{ package manager
      use "wbthomason/packer.nvim"
      -- }}}

      -- {{{ helpful plugins
      use "nvim-lua/plenary.nvim"
      use "BurntSushi/ripgrep"
      use {
          "folke/which-key.nvim",
          config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
          end
      }
      use "akinsho/toggleterm.nvim"

      use {
          "lukas-reineke/indent-blankline.nvim",
          config = function()
            require("indent_blankline").setup {
                -- for example, context is off by default, use this to turn it on
                show_current_context = true,
                show_current_context_start = true,
            }
          end
      }

      use {
          "mbbill/undotree",
          config = function()
            vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = "Undotree toggle" })
          end
      }
      -- }}}

      -- {{{ lsp
      use "neovim/nvim-lspconfig"
      -- }}}

      -- {{{ mason
      use "williamboman/mason.nvim"
      use "williamboman/mason-lspconfig.nvim"
      use "jayp0521/mason-nvim-dap.nvim"
      -- }}}

      -- {{{ completion framework
      use "hrsh7th/cmp-nvim-lsp"
      use "hrsh7th/cmp-buffer"
      use "hrsh7th/cmp-path"
      use "hrsh7th/cmp-cmdline"
      use "hrsh7th/nvim-cmp"
      use "L3MON4D3/LuaSnip"
      use "saadparwaiz1/cmp_luasnip"
      -- }}}

      -- {{{ debugging
      use "mfussenegger/nvim-dap"
      use "rcarriga/nvim-dap-ui"
      use "theHamsta/nvim-dap-virtual-text"
      -- }}}

      -- {{{ code editing
      use "tpope/vim-commentary"

      use {
          "windwp/nvim-autopairs",
          config = function()
            require("nvim-autopairs").setup {}
          end
      }
      -- }}}

      -- {{{ theming
      use {
          "tjdevries/express_line.nvim",
          config = function()
            require("el").setup {}
          end
      }
      use "kyazdani42/nvim-web-devicons"
      use "EdenEast/nightfox.nvim"
      use "marko-cerovac/material.nvim"
      use "rktjmp/lush.nvim"
      use "metalelf0/jellybeans-nvim"
      use "RRethy/nvim-base16"
      -- }}}

      -- {{{ telescope
      use "nvim-telescope/telescope.nvim"
      use "nvim-telescope/telescope-fzy-native.nvim"
      use {
          "nvim-treesitter/nvim-treesitter",
          run = ":TSUpdate",
          config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "c", "lua", "rust" },
                highlight = {
                    enable = true
                }
            }
          end
      }
      use "nvim-telescope/telescope-file-browser.nvim"
      -- }}}

      -- {{{ git
      use {
          "lewis6991/gitsigns.nvim",
          requires = { 'nvim-lua/plenary.nvim' },
          config = function()
            require('gitsigns').setup()
          end
      }
      -- }}}

      -- TODO: test
      use {
          "folke/todo-comments.nvim",
          requires = { 'nvim-lua/plenary.nvim' },
          config = function()
            require('todo-comments').setup {}

            vim.keymap.set("n", "]t", function()
              require("todo-comments").jump_next()
            end, { desc = "Next todo comment" })

            vim.keymap.set("n", "[t", function()
              require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })

            -- You can also specify a list of valid jump keywords

            vim.keymap.set("n", "]t", function()
              require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
            end, { desc = "Next error/warning todo comment" })

            vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope keywords=TODO,FIX<cr>',
            { desc = "Find TODOs with Telescope"})
          end
      }

      if packer_bootstrap then
        require('packer').sync()
      end
    end)
