return {
  -- coolshit
  'booperlv/nvim-gomove',
  'szw/vim-maximizer',
  'christoomey/vim-tmux-navigator',

  -- tpope
  'tpope/vim-surround',
  'tpope/vim-commentary',

  -- colorschemes
  'morhetz/gruvbox',
  'arcticicestudio/nord-vim',
  'navarasu/onedark.nvim',
  'catppuccin/nvim',
  {
    'rose-pine/neovim',
    config = function ()
      require('rose-pine').setup({
        dark_variant = 'moon'
      })
    end
  },

  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd([[
        let g:sonokai_style = 'andromeda'
        let g:sonokai_better_performance = 1
      ]])
      vim.cmd([[colorscheme sonokai]])
    end
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },

  {
    'Vimjas/vim-python-pep8-indent',
    ft = 'python'
  },
}
