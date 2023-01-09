return {
  "neovim/nvim-lspconfig",
  function()
    local ok, lspconfig = pcall(require, 'lspconfig')
    if not ok then
      return {}
    end

    local diagnostic_signs = { Error = "│", Warn = "│", Hint = "│", Info = "│" }
    for type, icon in pairs(diagnostic_signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

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
