return {
  "j-hui/fidget.nvim",
  function ()
    local ok, fidget = pcall(require, "fidget")
    if not ok then
      return {}
    end
    fidget.setup {
      text = {
        spinner = "earth"
      }
    }
  end
}
