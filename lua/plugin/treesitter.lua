return {
  "tree-sitter/tree-sitter",
  deps = {{
    "nvim-treesitter/nvim-treesitter",
    function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'lua', 'vim', 'help', 'python' },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        }
      }
    end,
    deps = "nvim-treesitter/nvim-treesitter-context"
  }}
}
