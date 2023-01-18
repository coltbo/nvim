vim.g.material_style = "darker"
require('material').setup({
  contrast = {
    terminal = true, -- Enable contrast for the built-in terminal
    sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = true, -- Enable contrast for floating windows
    cursor_line = true, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
  },

  styles = { -- Give comments style such as bold, italic, underline etc.
    comments = { italic = true },
    strings = { italic = true },
    keywords = { bold = true },
    functions = { bold = true },
    variables = {},
    operators = {},
    types = { bold = true },
  },

  plugins = { -- Uncomment the plugins that you use to highlight them
    --     -- Available plugins:
    "dap",
    --     -- "dashboard",
    "gitsigns",
    --     -- "hop",
    "indent-blankline",
    --     -- "lspsaga",
    --     -- "mini",
    --     -- "neogit",
    "nvim-cmp",
    --     -- "nvim-navic",
    "nvim-tree",
    "nvim-web-devicons",
    --     -- "sneak",
    "telescope",
    "trouble",
    "which-key",
  },

  disable = {
    colored_cursor = false, -- Disable the colored cursor
    borders = false, -- Disable borders between verticaly split windows
    background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
    term_colors = false, -- Prevent the theme from setting terminal colors
    eob_lines = false -- Hide the end-of-buffer lines
  },

  high_visibility = {
    lighter = false, -- Enable higher contrast text for lighter style
    darker = false -- Enable higher contrast text for darker style
  },

  async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

  custom_colors = nil, -- If you want to everride the default colors, set this to a function

  custom_highlights = {}, -- Overwrite highlights with your own
})

vim.cmd [[colorscheme jellybeans-nvim]]