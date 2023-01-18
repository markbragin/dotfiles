vim.cmd([[
  let g:sonokai_style = 'andromeda'
  let g:sonokai_better_performance = 1
]])

require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'moon',
})

local status, _ = pcall(vim.cmd, "colorscheme sonokai")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end
