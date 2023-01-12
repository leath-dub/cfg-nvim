return {
  "rebelot/kanagawa.nvim",
  function()
    local ok, kanagawa = pcall(require, "kanagawa")
    if not ok then
      return nil
    end
    local ok, colors = pcall(require, "kanagawa.colors")
    colors = colors.setup()
    if not ok then
      return nil
    end
    kanagawa.setup {
      statementStyle = { bold = false },
      overrides = {
        Boolean = { bold = false },
        CursorLineNr = { bold = false },
        CursorLine = { bg = colors.bg_light0, bold = false },
        MatchParen = { bold = false },
        LineNr = { bg = colors.bg_light0 },
        ["@keyword.operator"] = { bold = false }
      }
    }
    vim.cmd("colorscheme kanagawa")
  end,
  setup = function()
  end,
  deps = {
    require("plugin.stat")
  }
}
