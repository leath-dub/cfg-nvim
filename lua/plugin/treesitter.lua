return {
  "tree-sitter/tree-sitter",
  deps = {{
    "nvim-treesitter/nvim-treesitter",
    function()
      local ok, nvim_treesitter_config = pcall(require, "nvim-treesitter.configs")
      if not ok then
        return {}
      end
      nvim_treesitter_config.setup {
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
