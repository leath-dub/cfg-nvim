return {
  "hrsh7th/nvim-cmp",
  event = "UIEnter",
  config = function()
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local luasnip = require("luasnip")
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
        },
        ["<tab>"] = cmp.mapping.confirm {
          select = true
        },
        ["<c-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<c-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" })
      }),
      sources = {
        { name = "nvim_lsp", max_item_count = 20 },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer", keyword_length = 5 },
        { name = "path" },
        { name = "luasnip", keyword_length = 2 },
        { name = "calc" }
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
  dependencies = {
    require("plugin.nvim-lspconfig"),
    require("plugin.luasnip"),
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-calc",
    "saadparwaiz1/cmp_luasnip"
  }
}
