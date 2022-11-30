vim.cmd("highlight StatusNormal guifg=#2b3339 guibg=#a7c080")
vim.cmd("highlight StatusVisual guifg=#2b3339 guibg=#d699b6")
vim.cmd("highlight StatusSub guifg=#2b3339 guibg=#dbbc7f")
vim.cmd("highlight StatusCmd guifg=#2b3339 guibg=#dbbc7f")
vim.cmd("highlight StatusTerm guifg=#2b3339 guibg=#83c092")
vim.cmd("highlight StatusReplace guifg=#2b3339 guibg=#e67e80")
vim.cmd("highlight StatusRest guifg=#2b3339 guibg=#7fbbb3")
local modes = {
  ["n"] = "%#StatusNormal# N ",
  ["no"] = "%#StatusNormal# N ",
  ["v"] = "%#StatusVisual# V ",
  ["V"] = "%#StatusVisual# VL ",
  [""] = "%#StatusVisual# VB ",
  ["s"] = "%#StatusSub# S ",
  ["S"] = "%#StatusSub# SL ",
  [""] = "%#StatusSub# SB ",
  ["i"] = "%#StatusRest# I ",
  ["ic"] = "%#StatusRest# I ",
  ["R"] = "%#StatusReplace# R ",
  ["Rv"] = "%#StatusVisual# VR ",
  ["c"] = "%#StatusCmd# C ",
  ["cv"] = "%#StatusRest# VX ",
  ["ce"] = "%#StatusRest# EX ",
  ["r"] = "%#StatusRest# P ",
  ["rm"] = "%#StatusRest# M ",
  ["r?"] = "%#StatusCmd# C ",
  ["!"] = "%#StatusCmd# S ",
  ["t"] = "%#StatusTerm# T ",
}
local function mode()
  return modes[vim.api.nvim_call_function("mode", {})]
end
Statusline = {}
Statusline.active = function()
  return table.concat {
      "%#Whitespace# ",
      "%#Mode#",
      mode(),
      "%#Whitespace#"
  }
end

function Statusline.inactive()
  return "%#Whitespace#"
end
vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
