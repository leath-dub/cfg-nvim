return {
  "williamboman/mason.nvim",
  function()
    require('mason').setup()
  end,
  deps = {{
    "williamboman/mason-lspconfig.nvim",
    function()
      require('mason-lspconfig').setup()
    end
  }}
}
