return {
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
    require("plugin.nvim-lspconfig"),
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline"
  }
}
