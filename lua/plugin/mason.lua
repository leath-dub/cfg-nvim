return {
  "williamboman/mason.nvim",
  config = function()
    local ok, mason = pcall(require, "mason")
    if not ok then
      return {}
    end
    mason.setup()
  end,
  dependencies = {{
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
      if not ok then
        return {}
      end
      mason_lspconfig.setup()
    end
  }}
}
