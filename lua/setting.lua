vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.fileencoding = 'utf-8'
vim.opt.foldmethod = 'marker'
vim.opt.guicursor = ''
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = 'number'
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.opt.listchars = {
  space = '·',
  extends = '<',
  precedes = '>',
  trail = '¬',
  tab = '| '
}
vim.opt.cinoptions =
  [[
    >s,e0,n0,f0,{1s,},^0,L-1,:s,=s,l0,b0,gs,hs,N0,E0,ps,ts,is,+s
  ]]
vim.opt.completeopt = {
  "menu", "menuone"
}

-- function to set indent display
function indentLine()
  local indent_str = '│'
  local indent = vim.opt.shiftwidth:get()
  while (indent > 1) do
    indent_str = indent_str .. ' '
    indent = indent - 1
  end
  vim.opt.listchars:append({ multispace = indent_str })
end
vim.opt.fillchars = { eob = '\\' }

function indentN(n)
  vim.opt.expandtab = true
  vim.opt.tabstop = n
  vim.opt.softtabstop = n
  vim.opt.smarttab = true
  vim.opt.smartindent = true
  vim.opt.shiftwidth = n
end

vim.opt.list = true
vim.opt.laststatus = 3
vim.opt.colorcolumn = '80'

-- Term gui if not in tty
vim.cmd(
  [[
    set termguicolors
    if empty($DISPLAY)
      set termguicolors!
    endif
  ]]
)

vim.opt.cursorline = true
vim.opt.cursorlineopt = 'both'

-- autocmds
local autocmd = vim.api.nvim_create_autocmd

autocmd({"TermOpen"}, {pattern = {"*"}, command = "setlocal nonumber norelativenumber"})
autocmd({"TermOpen"}, {pattern = {"*"}, command = "setlocal signcolumn=no"})
autocmd({"BufRead", "BufNewFile"}, {pattern = {"*.ms", "*.me", "*.mom"}, command = "setlocal filetype=groff"})
autocmd({"BufRead", "BufNewFile"}, {pattern = {"*.mkd", "*.md", "*.mdown", "*.markdown"}, command = "setlocal spell"})
autocmd({"BufRead", "BufNewFile"}, {pattern = {"*.p8"}, command = "set filetype=lua"})

vim.cmd('filetype plugin on')
vim.cmd('set omnifunc=syntaxcomplete#Complete')
autocmd({"FileType"}, {pattern = {"c"}, command = "lua indentN(4) indentLine()"})
autocmd({"Filetype"}, {pattern = {"python"}, command = "lua indentLine()"})
autocmd({"Filetype"}, {pattern = {"python"}, command = "lua indentLine()"})
autocmd({"Filetype"}, {pattern = {"rust"}, command = "lua indentLine()"})
autocmd({"Filetype"}, {pattern = {"sh"}, command = "lua indentN(4) indentLine()"})
autocmd({"FileType"}, {pattern = {"go"}, command = "lua indentN(4) indentLine()"})
autocmd({"FileType"}, {pattern = {"java"}, command = "lua indentN(4) indentLine()"})
-- call indentline here so filetype is set
indentLine()
