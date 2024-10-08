if vim.bo.filetype ~= "cpp" then
  vim.keymap.set("n", "<F3>", "<cmd>make -C build/debug<CR>")
  vim.keymap.set("n", "<leader><F3>", "<cmd>make -C build/debug && /usr/local/bin/st -e bash -c 'bin/debug/*;read -p \"\nPress enter to continue...\"'<CR>")
  vim.keymap.set("n", "<F4>", "<cmd>make -C build/release<CR>")
  vim.keymap.set("n", "<leader><F4>", "<cmd>make -C build/release && /usr/local/bin/st -e bash -c 'bin/release/*;read -p \"\nPress enter to continue...\"'<CR>")
end
