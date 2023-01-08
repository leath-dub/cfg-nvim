return {
  "TimUntersberger/neogit",
  function()
    require("neogit").setup()
  end,
  requires = {
    "nvim-lua/plenary.nvim"
  }
}
