return {
  "sainnhe/everforest",
  function()
    vim.cmd("colorscheme everforest")
  end,
  setup = function()
    vim.g.everforest_better_performance = 1
    vim.g.everforest_enable_italic = 1
    vim.g.everforest_diagnostic_text_highlight = 1
    vim.g.everforest_diagnostic_line_highlight = 1
    vim.g.everforest_background = 'medium'
  end,
  deps = {
    require("plugin.stat")
  }
}
