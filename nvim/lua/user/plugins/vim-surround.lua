return {
  'tpope/vim-surround',
  dependencies = {
    'tpope/vim-repeat',
  },
  config = function ()
    vim.cmd([[let g:surround_{char2nr('b')} = "**\r**"]])
  end
}
