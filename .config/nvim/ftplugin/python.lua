-- run python script
vim.keymap.set("n", "<leader><F3>", "<cmd>w | !python3 %<CR>")
-- run black
vim.keymap.set("n", "<leader><F4>", "<cmd>w | !black -l 79 %<CR> <cmd>e<CR>")
