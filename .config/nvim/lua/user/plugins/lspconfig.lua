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
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', 'H', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', 'H', vim.diagnostic.open_float, opts)

    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }
    local go_handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
      ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = true
        }
      )
    }

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(_, bufnr)
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
      vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
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
      handlers = handlers,
    }

    lspconfig['clangd'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        filetypes = { "c", "cpp" },
        inlineHints = {
          enable = false,
        },
        giagnostics = {
          enable = false
        }
      },
      handlers = handlers,
    }

    lspconfig['gopls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      handlers = go_handlers,
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
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
              -- [vim.fn.expand("$HOME/.luarocks/")] = true,
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
      handlers = handlers,
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
      handlers = handlers,
    }

    lspconfig['csharp_ls'].setup {
      capabilities = capabilities,
      handlers = {
        ["textDocument/definition"] = require('csharpls_extended').handler,
        ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
      },
      on_attach = on_attach,
      settings = {
        filetypes = { "c#" },
        inlineHints = {
          enable = false,
        },
        diagnostics = {
          enable = false
        }
      },
      -- handlers = handlers,
    }


    -- lspconfig['texlab'].setup {
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   settings = {
    --     cmd = {
    --       "texlab",
    --     },
    --     filetypes = {
    --       "tex",
    --       "plaintex",
    --       "bib",
    --     },
    --     texlab = {
    --       build = {
    --         args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
    --         executable = "latexmk",
    --         forwardSearchAfter = false,
    --         onSave = true,
    --       },
    --       latexFormatter = "latexindent",
    --       latexindent = {
    --         modifyLineBreaks = false
    --       },
    --       rootDirectory = ".",
    --     },
    --     init_options = {
    --       buildDirectory = "build",
    --     },
    --     single_file_support = true,
    --   }
    -- }
    -- some settings
    vim.diagnostic.config({ virtual_text = false })
  end
}
