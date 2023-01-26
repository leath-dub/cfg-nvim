return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local ok, lspconfig = pcall(require, 'lspconfig')
    if not ok then
      return {}
    end

    local diagnostic_signs = { Error = "│", Warn = "│", Hint = "│", Info = "│" }
    for type, icon in pairs(diagnostic_signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lspconfig.jdtls.setup { single_file_support = true }
    lspconfig.sumneko_lua.setup {
      settings = {
        Lua = {
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file('', true),
          },
          diagnostics = {
            globals = {"vim"}
          },
          telemetry = {
            enable = false
          }
        }
      }
    }

    -- pip install python-lsp-server
    lspconfig.pylsp.setup {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = {'PEP8'},
              maxLineLength = 80
            }
          }
        }
      }
    }

    lspconfig.rust_analyzer.setup {}

    lspconfig.clangd.setup {}

    -- C/C++ lsp
    -- lspconfig.ccls.setup {
    --   init_options = {
    --     compilationDatabaseDirectory = "build";
    --     index = {
    --       threads = 0;
    --     };
    --     clang = {
    --       excludeArgs = { "-frounding-math"} ;
    --     };
    --   }
    -- }

    -- Typescript lsp
    lspconfig.denols.setup {}

    -- Go lsp
    lspconfig.gopls.setup {}
  end
}
