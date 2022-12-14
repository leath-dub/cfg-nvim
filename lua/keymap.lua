vim.g.mapleader = " "

-- Telescope
vim.keymap.set('n', '<leader>ff', function () return require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<leader>fg', function () return require('telescope.builtin').live_grep() end)

-- Copying and pasteing X11
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set("x", "<leader>p", "\"_bP")

-- goated bindings
vim.keymap.set('n', '<c-d>', 'M<c-d>')
vim.keymap.set('n', '<c-u>', 'M<c-u>')

-- Saving and quiting
vim.keymap.set('n', '<leader>s', ':w<cr>')
vim.keymap.set('n', '<leader>q', ':bd<cr>')

-- Netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Explore)

-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- comment
vim.keymap.set('v', '<leader>c', 'o<esc>O/*<esc>gvo<esc>o*/')

-- lsp
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- TODO set preview when selecting options ( the hover functionality )
    vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
    vim.keymap.set('i', '<c-n>', '<c-x><c-o><esc>:lua vim.lsp.buf.hover()<cr>a', { buffer = args.buf })
    if client.server_capabilities.hoverProvider then
      vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, { buffer = args.buf })
    end
    if client.server_capabilities.definitionProvider then
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
    end
  end,
})
