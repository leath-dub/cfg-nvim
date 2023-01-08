return {
  "sainnhe/everforest",
  function() return SetTheme('everforest') end,
  setup = function()
    vim.g.everforest_better_performance = 1
    vim.g.everforest_background = 'medium'
  end,
  deps = {
    require("plugin.stat")
  }
}
