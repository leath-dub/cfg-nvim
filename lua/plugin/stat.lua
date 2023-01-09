return {
    "leath-dub/stat.nvim",
    function()
      local ok, stat = pcall(require, "stat")
      if not ok then
        return {}
      end
      stat.setup {}
    end
}
