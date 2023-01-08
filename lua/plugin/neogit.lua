return {
  "TimUntersberger/neogit",
  function()
    require("neogit").setup()
  end,
  deps = {
    "nvim-lua/plenary.nvim"
  }
}
