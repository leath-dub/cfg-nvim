return {
  "cbochs/grapple.nvim",
  function ()
    local ok, grapple = pcall(require, "grapple")
    if not ok then
      return {}
    end
    __grapple_previous_tag = nil
    function tag_swap()
      local current = grapple.key()
      if __grapple_previous_tag then
        grapple.select({ key = __grapple_previous_tag })
      end
      __grapple_previous_tag = current
    end
    -- keybinds for grapple
    vim.keymap.set("n", "<leader>t", grapple.popup_tags)
    vim.keymap.set("n", "<leader>gt", grapple.toggle)
    vim.keymap.set("n", "<leader>gs", grapple.popup_scopes)
    vim.keymap.set("n", "<leader>j", tag_swap)
    -- tag a directory
    local function tag_dir()
      local dir_path = vim.loop.cwd()
      dir_path = vim.fs.normalize(dir_path)
      for file_name, _ in vim.fs.dir(dir_path) do
        local file_path = vim.fs.normalize(dir_path .. "/" .. file_name)
        if vim.fn.isdirectory(file_path) == 0 then
          require("grapple").tag({ file_path = file_path })
        end
      end
    end
    vim.keymap.set("n", "<leader>gtd", tag_dir)
  end,
  function()
    local ok, mason = pcall(require, "mason")
  end,
  requires = {
    "nvim-lua/plenary.nvim"
  }
}
