return {
  "hrsh7th/nvim-cmp",
  function()
    local cmp = require("cmp")
    if cmp ~= nil then cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      },
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
    require("plugin.nvim-lspconfig"),
    require("plugin.luasnip"),
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline"
  }
}
