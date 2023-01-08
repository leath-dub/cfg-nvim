function SetTheme(name)
  vim.cmd('silent! colorscheme ' .. name)
end

-- TODO move configs to after/plugin
-- TODO setup Mason for language servers

require("bootstrap")
require("dep") {
  require("plugin.neogit"),
  require("plugin.nvim-colorizer"),
  require("plugin.markdown-preview"),
  require("plugin.everforest"),
  {
    "ThePrimeagen/harpoon",
    requires = "nvim-lua/plenary.nvim"
  },
  "mbbill/undotree",
  require("plugin.mason"),
  require("plugin.treesitter"),
  require("plugin.telescope"),
  require("plugin.nvim-cmp")
}
