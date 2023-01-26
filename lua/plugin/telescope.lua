return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
  },
  cmd = "Telescope",
  keys = {
    {"<leader>pf", function ()
        return require('telescope.builtin').find_files()
      end},
    {"<leader>ps", function ()
        return require('telescope.builtin').live_grep()
      end},
    {"<leader>?", function ()
      return require('telescope.builtin').help_tags()
    end},
    {"<leader>b", function ()
      return require("telescope.builtin").buffers()
    end},
    {"<leader>m", function ()
      return require("telescope.builtin").marks()
    end},
    {"<leader>r", function ()
      return require("telescope.builtin").builtin()
    end}
  },
  config = function()
    local ok, telescope = pcall(require, "telescope")
    if not ok then
      return {}
    end
    telescope.setup {
      defaults = {
        layout_config = {
          vertical = { width = .9 },
          horizontal = { width = .9 }
        }
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          hidden = true
        },
        live_grep = {
          theme = "dropdown"
        },
        builtin = {
          theme = "dropdown"
        }
      }
    }
    telescope.load_extension("fzy_native")
  end
}
