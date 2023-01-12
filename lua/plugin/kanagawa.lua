return {
  "rebelot/kanagawa.nvim",
  function()
    vim.cmd("colorscheme kanagawa")
  end,
  deps = {
    require("plugin.stat")
  }
}
