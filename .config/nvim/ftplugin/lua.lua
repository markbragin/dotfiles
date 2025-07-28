vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "vim", "go" },
  command = "set tabstop=2 | set shiftwidth=2",
})

vim.opt.autoindent = true
vim.opt.tabstop = 2 -- 4 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 4 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
