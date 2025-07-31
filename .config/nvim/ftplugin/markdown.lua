vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  command = "setlocal spelllang=en,ru | setlocal spell",
})

vim.keymap.set("n", "<leader>rm", function() vim.call("RenderMarkdown toggle") end)
