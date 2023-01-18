return {
  "leath-dub/stat.nvim",
  event = "Colorscheme",
  config = function()
    local ok, stat = pcall(require, "stat")
    if not ok then
      return {}
    end
    local ___ = __Stat__.___
    stat.setup {
      winbar = {
        ___,
        __Stat__.mod.file()
      },
      statusline = {
        ___,
        __Stat__.mod.mode,
        __Stat__.mod.filetype,
        __Stat__.mod.git_diff
      },
      theme = {
        ["N"] = { fg = "#1f1f28", bg = "#7aa89f" },
        ["I"] = { fg = "#1f1f28", bg = "#7e9cd8" },
        ["V"] = { fg = "#1f1f28", bg = "#dca561" },
        ["C"] = { fg = "#1f1f28", bg = "#d27e99" },
        ["T"] = { fg = "#1f1f28", bg = "#98bb6c" },
        ["S"] = { fg = "#1f1f28", bg = "#e46876" },
        ["File"] = { fg = "#dcd7ba", bg = "#363646" },
        ["Filetype"] = { fg = "#dcd7ba", bg = "#363646" },
        ["GitDiffDeletion"] = { fg = "#e46876", bg = "#2a2a37" },
        ["GitDiffInsertion"] = { fg = "#98bb6c", bg = "#2a2a37" }
      }
    }
  end
}
