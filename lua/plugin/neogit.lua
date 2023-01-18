return {
  "TimUntersberger/neogit",
  cmd = "Neogit",
  config = function()
    local ok, neogit = pcall(require, "neogit")
    if not ok then
      return {}
    end
    neogit.setup()
  end,
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}
