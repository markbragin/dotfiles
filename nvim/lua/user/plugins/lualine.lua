local custom_gruvbox = require('lualine.themes.gruvbox')
custom_gruvbox.command.b = custom_gruvbox.insert.b
custom_gruvbox.command.c = custom_gruvbox.insert.c
custom_gruvbox.visual.b = custom_gruvbox.insert.b
custom_gruvbox.visual.c = custom_gruvbox.insert.c


require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 0,
      tabline = 0,
      winbar = 0,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z  = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'branch', 'diff'},
    lualine_c = {{'filename', path = 3}},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_z = {'tabs'}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {'quickfix'}
}
