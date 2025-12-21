return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'adoyle-h/lsp-toggle.nvim',
  },
  lazy = true,
  config = function()
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local def_mappings = true;
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

      if def_mappings then
        vim.keymap.del('n', 'grt')
        vim.keymap.del('n', 'gri')
        vim.keymap.del('n', 'gra')
        vim.keymap.del('x', 'gra')
        vim.keymap.del('n', 'grr')
        vim.keymap.del('n', 'grn')
        def_mappings = false
      end
    end

    -- Set up lspconfig.
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("clangd", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        filetypes = { "c", "cpp" },
        inlineHints = {
          enable = false,
        },
        diagnostics = {
          enable = false
        },
      },
    })

    vim.lsp.config("lua_ls", {
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

    vim.lsp.config("gopls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        cmd = {
          "gopls",
        },
        filetypes = {
          "go", "gomod", "gowork", "gotmpl"
        },
      },
    })

    vim.lsp.config("cmake", {
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
    })

    vim.lsp.enable("pyright", true)
    vim.lsp.enable("clangd", true)
    vim.lsp.enable("gopls", true)
    vim.lsp.enable("cmake", true)
    vim.lsp.enable("lua_ls", true)
    vim.lsp.enable("ts_ls")

    -- some settings
    vim.diagnostic.config({ virtual_text = false })
  end
}
