return {
  "TimUntersberger/neogit",
  function()
    local ok, neogit = pcall(require, "neogit")
    if not ok then
      return {}
    end
    neogit.setup()
  end,
  requires = {
    "nvim-lua/plenary.nvim"
  }
}
