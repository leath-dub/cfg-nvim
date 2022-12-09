function SetTheme(name)
  vim.cmd('silent! colorscheme ' .. name)
end

require "bootstrap"
require "dep" {
  {
    "sainnhe/everforest",
    function() return SetTheme('everforest') end,
    setup = function()
      vim.g.everforest_better_performance = 1
      vim.g.everforest_background = 'hard'
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
  {
    "tree-sitter/tree-sitter",
    deps = {
      "nvim-treesitter/nvim-treesitter",
      setup = function()
        require('nvim-treesitter.configs').setup {
          ensure_installed = { 'c', 'lua' },
          sync_install = false,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
          }
        }
      end,
      deps = "nvim-treesitter/nvim-treesitter-context"
    }
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
       "neovim/nvim-lspconfig",
       "hrsh7th/cmp-nvim-lsp",
       "hrsh7th/cmp-buffer",
       "hrsh7th/cmp-path",
       "hrsh7th/cmp-cmdline"
    }
  }
}
