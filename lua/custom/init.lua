vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    vim.cmd.colorscheme("solarized-osaka-night")
  end,
})
