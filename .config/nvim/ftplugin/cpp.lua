vim.keymap.set("n", "<F3>", "<cmd>!cmake --build build/debug <CR>")
vim.keymap.set("n", "<leader><F3>", "<cmd>!cmake --build build/debug && /usr/local/bin/st -e bash -c 'bin/debug/*;echo;read -p \"Press enter to continue...\"'<CR>")
vim.keymap.set("n", "<F4>", "<cmd>!cmake --build build/release<CR>")
vim.keymap.set("n", "<leader><F4>", "<cmd>!cmake --build build/release && /usr/local/bin/st -e bash -c 'bin/release/*;echo;read -p \"Press enter to continue...\"'<CR>")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
