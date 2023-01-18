return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  build = function()
    local handle
    handle = vim.loop.spawn("yarn", {
      args = {"add", "./app"},
    },
    function(status)
      handle:close()
    end)
  end
}
