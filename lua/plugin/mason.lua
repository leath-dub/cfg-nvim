return {
  "williamboman/mason.nvim",
  function()
    local ok, mason = pcall(require, "mason")
    if not ok then
      return {}
    end
    mason.setup()
  end,
  deps = {{
    "williamboman/mason-lspconfig.nvim",
    function()
      local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
      if not ok then
        return {}
      end
      mason_lspconfig.setup()
    end
  }}
}
