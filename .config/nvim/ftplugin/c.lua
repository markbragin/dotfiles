if vim.bo.filetype ~= "cpp" then
  vim.opt.autoindent = true
  vim.opt.tabstop = 4       -- 4 spaces for tabs (prettier default)
  vim.opt.shiftwidth = 4    -- 4 spaces for indent width
  vim.opt.expandtab = false -- don't expand tab to spaces

  vim.keymap.set("n", "<F3>", "<cmd>make -C build/debug<CR>")
  vim.keymap.set("n", "<leader><F3>", "<cmd>make -C build/debug && /usr/local/bin/st -e bash -c 'bin/debug/*;read -p \"\nPress enter to continue...\"'<CR>")
  vim.keymap.set("n", "<F4>", "<cmd>make -C build/release<CR>")
  vim.keymap.set("n", "<leader><F4>", "<cmd>make -C build/release && /usr/local/bin/st -e bash -c 'bin/release/*;read -p \"\nPress enter to continue...\"'<CR>")
end
