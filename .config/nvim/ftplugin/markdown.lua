vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  command = "setlocal spelllang=en,ru | setlocal spell",
})

if vim.g.markdown_conceal_state == nil then
  vim.g.markdown_conceal_state = 1
end

vim.api.nvim_create_user_command('ToggleConceal', function()
  vim.g.markdown_conceal_state = (vim.g.markdown_conceal_state == 0) and 1 or 0
  vim.wo.conceallevel = vim.g.markdown_conceal_state
  print("Markdown Conceal: " .. vim.g.markdown_conceal_state)
end, { desc = 'Toggle markdown conceal globally' })

vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
  pattern = "markdown",
  callback = function()
    vim.wo.conceallevel = vim.g.markdown_conceal_state
  end,
})
