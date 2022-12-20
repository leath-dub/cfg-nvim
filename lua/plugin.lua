function SetTheme(name)
  vim.cmd('silent! colorscheme ' .. name)
end

-- TODO move configs to after/plugin
-- TODO setup Mason for language servers

require("bootstrap")
require("dep") {
  {
    "sainnhe/everforest",
    function() return SetTheme('everforest') end,
    setup = function()
      vim.g.everforest_better_performance = 1
      vim.g.everforest_background = 'medium'
    end
  },
  {
    "RRethy/vim-hexokinase",
    config = function()
      os.execute("make hexokinase")
    end
  },
  {
    "ThePrimeagen/harpoon",
    requires = "nvim-lua/plenary.nvim"
  },
  "mbbill/undotree",
  {
    "tree-sitter/tree-sitter",
    deps = {{
      "nvim-treesitter/nvim-treesitter",
      function()
        require('nvim-treesitter.configs').setup {
          ensure_installed = { 'c', 'lua', 'vim', 'help', 'python' },
          sync_install = false,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
          }
        }
      end,
      deps = "nvim-treesitter/nvim-treesitter-context"
    }}
  },
  {
    "nvim-telescope/telescope.nvim",
    function()
      require('telescope').setup {
        pickers = {
          find_files = {
            hidden = true
          }
        }
      }
    end,
    requires = "nvim-lua/plenary.nvim",
    deps = "nvim-telescope/telescope-fzy-native.nvim"
  },
  {
    "hrsh7th/nvim-cmp",
    function()
      local cmp = require("cmp")
      if cmp ~= nil then cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<c-y>"] = cmp.mapping.confirm {
            select = true
          }
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer", keyword_length = 5 },
          { name = "path" }
        },
        experimental = {
          native_menu = false,
          ghost_text = true
        }
      })
      end
    end,
    requires = {
      {
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
      },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline"
    }
  }
}
