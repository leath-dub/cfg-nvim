return {
  "neovim/nvim-lspconfig",
  function()
    local lspconfig = require('lspconfig')

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

    lspconfig.sumneko_lua.setup {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      }
    }

    -- C/C++ lsp
    lspconfig.ccls.setup {
      init_options = {
        compilationDatabaseDirectory = "build";
        index = {
          threads = 0;
        };
        clang = {
          excludeArgs = { "-frounding-math"} ;
        };
      }
    }

    -- Typescript lsp
    lspconfig.denols.setup {}

    -- Go lsp
    lspconfig.gopls.setup {}
  end
}
