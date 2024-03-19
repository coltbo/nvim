vim.api.nvim_create_autocmd("FileType", {
  pattern = "ocaml",
  callback = function (args)
    vim.cmd("set makeprg=dune\\ build")
  end
})
