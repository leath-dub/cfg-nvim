return {
  "NvChad/nvim-colorizer.lua",
  event = "Colorscheme",
  config = function()
    local ok, colorizer = pcall(require, "colorizer")
    if not ok then
      return {}
    end
    colorizer.setup()
  end
}
