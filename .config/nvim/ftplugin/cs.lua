vim.keymap.set("n", "<F3>", "<cmd>!dotnet build<CR>")
vim.keymap.set("n", "<leader><F3>", "<cmd>!/usr/local/bin/st -e bash -c 'bin/Debug/net8.0/`basename $PWD`;read -p \"Press any key to continue...\"' <CR>")

vim.keymap.set("n", "<F4>", "<cmd>!dotnet build --configuration Release<CR>")
vim.keymap.set("n", "<leader><F4>", "<cmd>!/usr/local/bin/st -e bash -c 'bin/Release/net8.0/`basename $PWD`;read -p \"Press any key to continue...\"'<CR>")

vim.keymap.set("n", "<leader><F5>", "<cmd>!dotnet run<CR>")
