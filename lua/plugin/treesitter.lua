return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "Colorscheme",
    config = function()
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
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre"
  }
}
