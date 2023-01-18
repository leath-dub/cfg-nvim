return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  config = function ()
    local ok, fidget = pcall(require, "fidget")
    if not ok then
      return nil
    end
    fidget.setup {
      text = {
        spinner = {
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " "
        }
      }
    }
  end
}
