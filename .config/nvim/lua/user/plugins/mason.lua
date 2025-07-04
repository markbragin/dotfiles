return {
  'williamboman/mason.nvim',
  version = "^1.0.0",
  dependencies = {
    { 'williamboman/mason-lspconfig.nvim', version = "^1.0.0" },
    -- {'williamboman/mason-lspconfig.nvim'},
  },
  config = function()
    require('mason').setup()
    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
        "cmake",
      },
      -- auto-install configured servers (with lspconfig)
      -- automatic_enable = true, -- not the same as ensure_installed
    })
  end
}
