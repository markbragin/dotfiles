return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    options = {
      icons_enabled = false,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {
        'dapui_watches',
        'dapui_breakpoints',
        'dapui_scopes',
        'dapui_stacks',
        'dapui_console',
        'dap-repl',
      },
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
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
}
