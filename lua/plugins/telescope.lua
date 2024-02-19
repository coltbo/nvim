local function telescope_call(func)
  local opts = require('telescope.themes').get_ivy {}
  require('telescope.builtin')[func](opts)
end

return {
  "nvim-telescope/telescope-fzy-native.nvim",
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      -- {{{ file searching
      { "<leader>f",  function() telescope_call('find_files') end,           desc = "Search files" },
      { "<leader>g",  function() telescope_call('live_grep') end,            desc = "Live grep" },
      { "<leader>s",  function() telescope_call('grep_string') end,          desc = "Search buffer" },
      { "<leader>b",  function() telescope_call('buffers') end,              desc = "Search buffer" },
      -- }}}

      -- {{{ lsp
      { "<leader>q",  function() telescope_call("quickfix") end,             desc = "Search quickfix" },
      { "<leader>d",  function() telescope_call('lsp_definitions') end,      desc = "Search definitions" },
      { "<leader>i",  function() telescope_call('lsp_implementations') end,  desc = "Search implementations" },
      { "<leader>r",  function() telescope_call('lsp_references') end,       desc = "Search references" },
      { "<leader>o",  function() telescope_call("lsp_document_symbols") end, desc = "Search symbol" },
      -- }}}

      -- {{{ vim related
      { "<leader>h",  function() telescope_call('help_tags') end,            desc = "Search help tags" },
      { "<leader>p",  function() telescope_call('commands') end,             desc = "Search commands" },
      { "<leader>ph", function() telescope_call('command_history') end,      desc = "Search command history" },
      { "<leader>k",  function() telescope_call('keymaps') end,              desc = "Search keymaps" },
      -- }}}

      -- {{{ utils
      { "<leader>m",  function() telescope_call('man_pages') end,            desc = "Search keymaps" },
      -- }}}
    },
    config = function()
      require("telescope").load_extension("fzy_native")
    end
  }
}
