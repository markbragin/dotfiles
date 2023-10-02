-- vim.opt.guicursor = ""

vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
vim.opt.shiftwidth = 4 -- 4 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.copyindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "vim" },
  command = "set tabstop=2 | set shiftwidth=2",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "python" },
  command = "set tabstop=4 | set shiftwidth=4",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  command = "setlocal spelllang=en,ru | setlocal spell",
})

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hidden = true

vim.opt.scrolloff = 7
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"

-- lang
vim.opt.keymap = "russian-jcukenwin"
vim.opt.iminsert = 0
vim.opt.imsearch = 0

-- backspace
vim.opt.backspace = "indent,eol,start"

-- comments
vim.cmd([[
  autocmd FileType cpp,json setlocal commentstring=//%s
]])

vim.cmd([[
  autocmd FileType json syntax match Comment +\/\/.\+$+
]])

-- open help with vertical split
vim.cmd("cabbrev h vert bo h")
