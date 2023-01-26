-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- statusline
  use 'nvim-lualine/lualine.nvim'

  -- coolshit
  use 'windwp/nvim-autopairs'
  use 'booperlv/nvim-gomove'
  use 'szw/vim-maximizer'
  use 'christoomey/vim-tmux-navigator'

  -- tpope
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  -- colorschemes
  use 'morhetz/gruvbox'
  use 'arcticicestudio/nord-vim'
  use 'navarasu/onedark.nvim'
  use 'rose-pine/neovim'
  use 'sainnhe/sonokai'
  -- icons
  -- use 'ryanoasis/vim-devicons'

  -- lsp
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use 'folke/neodev.nvim'

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip' -- for autocompletion
  use 'rafamadriz/friendly-snippets' -- useful snippets

  -- debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { 'adoyle-h/lsp-toggle.nvim' }

  -- indentation
  use 'lukas-reineke/indent-blankline.nvim'

end)
