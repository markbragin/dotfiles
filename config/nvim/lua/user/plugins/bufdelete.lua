return {
  'famiu/bufdelete.nvim',
  config = function()
    local builtin = require('bufdelete')
    vim.keymap.set('n', 'gw', builtin.bufdelete)
  end
}

