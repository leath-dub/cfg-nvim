require("bootstrap")
require("lazy").setup {
  require("plugin.neogit"),
  require("plugin.fidget"),
  require("plugin.grapple"),
  require("plugin.nvim-colorizer"),
  require("plugin.markdown-preview"),
  require("plugin.colorscheme"),
  "mbbill/undotree",
  require("plugin.mason"),
  require("plugin.treesitter"),
  require("plugin.telescope"),
  require("plugin.nvim-cmp"),
  performance = {
    cache = {
      enabled = true
    }
  }
}

