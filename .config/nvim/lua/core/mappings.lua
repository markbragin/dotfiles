vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- clipboard
vim.keymap.set({ "n", "v" }, "<C-y>", [["+y]])
vim.keymap.set({ "n", "v" }, "<C-p>", [["+p]])
vim.keymap.set({ "n", "v" }, "<space>d", [["_d]])

-- greatest remap ever
vim.keymap.set("x", "<space>p", [["_dP]])
vim.keymap.set("n", "qwe", [[<C-e>]])

-- vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- windows
-- using vim-tmux-naviigator instead
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-q>", "<C-w>q")

-- window management
vim.keymap.set("n", "<C-w>e", "<C-w>=")     -- make split windows equal width & height
vim.keymap.set("n", "<C-w>x", ":close<CR>") -- close current split window

-- resize windows
vim.keymap.set("n", "<C-Left>", "<C-w>5<")
vim.keymap.set("n", "<C-Right>", "<C-w>5>")
vim.keymap.set("n", "<C-Up>", "<C-w>+")
vim.keymap.set("n", "<C-Down>", "<C-w>-")


-- replace word in the whole doc
vim.keymap.set("n", "<space>ss",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make script executable
vim.keymap.set("n", "<leader>sx", "<cmd>!chmod +x %<CR>", { silent = true })
-- run srcipt
vim.keymap.set("n", "<leader>sr", "<cmd>!%:p<CR>", { silent = true })

-- edit/reload config
vim.keymap.set("n", "<leader>ev", function() vim.cmd("e $MYVIMRC") end)
vim.keymap.set("n", "<leader>sv", function() vim.cmd("so $MYVIMRC") end)
-- edit mappings
vim.keymap.set("n", "<leader>em", function()
  local path = vim.fn.stdpath("config") .. "/lua/core/mappings.lua"
  vim.cmd("e " .. path)
end)
-- edit options
vim.keymap.set("n", "<leader>eo", function()
  local path = vim.fn.stdpath("config") .. "/lua/core/options.lua"
  vim.cmd("e " .. path)
end)
-- open file browser in plugins directory
vim.keymap.set('n', '<leader>ep', function()
  local path = vim.fn.stdpath("config") .. "/lua/plugins"
  vim.cmd("Telescope file_browser path=" .. path)
end)
-- open file browser in stdpath('config') directory
vim.keymap.set('n', '<leader>ec', function()
  local path = vim.fn.stdpath("config")
  vim.cmd("Telescope file_browser path=" .. path)
end)

-- buffers
vim.keymap.set("n", "gn", "<cmd>bn<CR>")
vim.keymap.set("n", "gp", "<cmd>bp<CR>")
-- vim.keymap.set("n", "gw", "<cmd>Bclose<CR>")
-- vim.keymap.set("n", "<leader>gw", "<cmd>Bclose!<CR>" )
vim.keymap.set("n", "gW", "<cmd>bdel<CR>")

-- search
vim.keymap.set("n", "<F1>", [[:set invhlsearch<CR>]], { silent = true })

-- lang
vim.keymap.set("i", "<C-l>", "<C-^>")

-- tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")     --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")     --  go to previous tab

-- insert blanck line

vim.keymap.set("n", "<space>o", "o<ESC>0d$")
vim.keymap.set("n", "<space>O", "O<ESC>0d$")

--
vim.g.maximizer_default_mapping_key = '<F2>'

--
-- exit terminal mode
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { noremap = true })

-- compile debug and release version of cpp project
-- vim.keymap.set("n", "<F3>", "<cmd>make -C build/debug<CR>")
-- vim.keymap.set("n", "<leader><F3>", "<cmd>make -C build/debug && /usr/bin/alacritty --hold -e bin/debug/*<CR>")
-- vim.keymap.set("n", "<F4>", "<cmd>make -C build/release<CR>")
-- vim.keymap.set("n", "<leader><F4>", "<cmd>make -C build/release && /usr/bin/alacritty --hold -e bin/release/*<CR>")

-- vim.keymap.set("n", "<F3>", "<cmd>make -C build/debug<CR>")
-- vim.keymap.set("n", "<leader><F3>", "<cmd>make -C build/debug && /usr/local/bin/st -e bash -c 'bin/debug/*;read'<CR>")
-- vim.keymap.set("n", "<F4>", "<cmd>make -C build/release<CR>")
-- vim.keymap.set("n", "<leader><F4>", "<cmd>make -C build/release && /usr/local/bin/st -e bash -c 'bin/release/*;read'<CR>")

-- markdown-preview
-- vim.keymap.set("n", "<leader>md")


-- run python script
vim.keymap.set("n", "<leader>pr", "<cmd>w | !python3 %<CR>")
-- run black
vim.keymap.set("n", "<leader>pb", "<cmd>w | !black -l 100 %<CR> <cmd>e<CR>")

-- run lua script
vim.keymap.set("n", "<leader>lr", "<cmd>w | !lua %<CR>")

-- build latex doc
vim.keymap.set("n", "<leader>tb", "<cmd>TexlabBuild<CR>")
