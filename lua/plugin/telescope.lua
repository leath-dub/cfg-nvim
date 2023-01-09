return {
  "nvim-telescope/telescope.nvim",
  function()
    local ok, telescope = pcall(require, "telescope")
    if not ok then
      return {}
    end
    telescope.setup {
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
