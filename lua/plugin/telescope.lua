return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {"nvim-telescope/telescope-fzy-native.nvim", build = "make"}
  },
  cmd = "Telescope",
  keys = {
    {"<leader>pf", function ()
        return require('telescope.builtin').find_files()
      end},
    {"<leader>ps", function ()
        return require('telescope.builtin').live_grep()
      end}
  },
  config = function()
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
    telescope.load_extension("fzy_native")
  end
}
