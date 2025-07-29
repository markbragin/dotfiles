return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- snippets
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      -- dependencies = {'rafamadriz/friendly-snippets'},
    },
    'saadparwaiz1/cmp_luasnip',
    'ray-x/lsp_signature.nvim',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    vim.opt.completeopt = "menu,menuone,noselect"

    -- Set up nvim-cmp.
    cmp.setup({
      preselect = cmp.PreselectMode.None,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        -- end
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
      }),
      formatting = {
        expandable_indicator = true,
      }
    })

    local signature_config = {
      bind = true,
      hint_enable = false,
      handler_opts = { border = "rounded" },
    }

    require("lsp_signature").setup(signature_config)
  end
}
