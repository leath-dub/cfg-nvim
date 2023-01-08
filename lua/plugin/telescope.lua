return {
  "nvim-telescope/telescope.nvim",
  function()
    require('telescope').setup {
      pickers = {
        find_files = {
          hidden = true
        }
      }
    }
  end,
  requires = "nvim-lua/plenary.nvim",
  deps = "nvim-telescope/telescope-fzy-native.nvim"
}
