return {
  -- 'nvim-telescope/telescope.nvim', tag = '0.1.0',
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    require('telescope').setup {
      pickers = {
      },
      extensions = {
        fzf = {},
        file_browser = {
          theme = "dropdown",
          -- cwd_to_path = true,
          -- path = "%:p:h",
        },
      }
    }
    require('telescope').load_extension('fzf')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fF', "<cmd>Telescope find_files cwd=%:p:h<CR>", {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>fs', builtin.treesitter, {})
    vim.keymap.set('n', '<leader>fq', builtin.colorscheme, {})
    vim.keymap.set('n', '<leader>fm', builtin.keymaps, {})
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
    vim.keymap.set('n', '<leader>fc', builtin.commands, {})
    vim.keymap.set('n', '<leader>fb', "<cmd>Telescope file_browser<CR>", {})
    vim.keymap.set('n', '<leader>fB', "<cmd>Telescope file_browser path=%:p:h<CR>", {})
    vim.keymap.set('n', '<leader>tl', "<cmd>Telescope ToggleLSP<CR>", {})

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('file_browser')
    require('lsp-toggle').setup()
  end
}
