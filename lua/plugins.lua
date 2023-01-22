return require("packer").startup(function(use)

  -- {{{ package manager
  use "wbthomason/packer.nvim"
  -- }}}

  -- {{{ helpful plugins
  use "nvim-lua/plenary.nvim"
  use "BurntSushi/ripgrep"
  use "folke/which-key.nvim"
  use "akinsho/toggleterm.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "mbbill/undotree"
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
  use "windwp/nvim-autopairs"
  -- }}}

  -- {{{ theming
  use "tjdevries/express_line.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "EdenEast/nightfox.nvim"
  use "marko-cerovac/material.nvim"
  use "rktjmp/lush.nvim"
  use "metalelf0/jellybeans-nvim"
  -- }}}

  -- {{{ telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use "nvim-telescope/telescope-file-browser.nvim"
  -- }}}

  -- {{{ git 
  use "lewis6991/gitsigns.nvim"
  -- }}}

  use "folke/todo-comments.nvim"
end)
