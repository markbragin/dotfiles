return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'adoyle-h/lsp-toggle.nvim',
  },
  lazy = true,
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(_, bufnr)
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'H', vim.diagnostic.open_float, bufopts)
      vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, bufopts)
      vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, bufopts)
      vim.keymap.set('n', 'H', vim.diagnostic.open_float, bufopts)
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)

      vim.keymap.set('n', 'gs', function() return vim.lsp.buf.signature_help({ border = "rounded" }) end, bufopts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', function() return vim.lsp.buf.hover({ border = "rounded" }) end, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end

    -- Set up lspconfig.
    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig['pyright'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['clangd'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        filetypes = { "c", "cpp" },
        inlineHints = {
          enable = false,
        },
        diagnostics = {
          enable = false
        }
      },
    }

    lspconfig['gopls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig['lua_ls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            enable = true,
            globals = { 'vim' },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME")] = true,
              [vim.fn.stdpath("config")] = true,
            },
          },
          completions = {
            displayContext = true,
          },
          hint = {
            enable = true,
          }
        },
      },
    })

    lspconfig['cmake'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        cmd = {
          "cmake-language-server",
        },
        filetypes = {
          "cmake",
        },
        init_options = {
          buildDirectory = "build",
        },
        single_file_support = true,
      },
    }

    -- some settings
    vim.diagnostic.config({ virtual_text = false })
  end
}
