return {
  "NvChad/nvim-colorizer.lua",
  function()
    local ok, colorizer = pcall(require, "colorizer")
    if not ok then
      return {}
    end
    colorizer.setup()
  end
}
