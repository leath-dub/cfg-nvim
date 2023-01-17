return {
  "hrsh7th/nvim-cmp",
  function()
    local ok, cmp = pcall(require, "cmp")
    if not ok then
      return {}
    end
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
        { name = "nvim_lsp", max_item_count = 20 },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer", keyword_length = 5 },
        { name = "path" },
        { name = "luasnip" }
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      experimental = {
        native_menu = false,
        ghost_text = true
      }
    })
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "buffer", max_item_count = 20 },
        { name = "path", max_item_count = 20 },
      }),
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "cmdline", max_item_count = 8 },
      }),
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
  },
}
