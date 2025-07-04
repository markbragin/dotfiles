return {
  -- coolshit
  'szw/vim-maximizer', -- maximize pane
  'christoomey/vim-tmux-navigator',

  -- tpope
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
      vim.g.sonokai_style = 'andromeda'
      vim.g.sonokai_better_performance = 1
    end
  },

  {
    'Vimjas/vim-python-pep8-indent',
    ft = 'python'
  },
}
