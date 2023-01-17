vim.cmd([[
  if has('termguicolors')
    set termguicolors
  endif
  " The configuration options should be placed before `colorscheme sonokai`.
  let g:sonokai_style = 'andromeda'
  let g:sonokai_better_performance = 1
]])

local status, _ = pcall(vim.cmd, "colorscheme sonokai")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end
