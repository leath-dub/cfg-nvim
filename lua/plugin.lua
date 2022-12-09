-- bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

function SetTheme(name)
  vim.cmd('silent! colorscheme ' .. name)
end

return require('packer').startup({function(use)

  use 'wbthomason/packer.nvim'

  use 'rust-lang/rust.vim'
  use 'LnL7/vim-nix'
  use {
    'sainnhe/everforest',
    setup = function()
      vim.g.everforest_better_performance = 1
      vim.g.everforest_background = 'hard'
    end,
    config = "SetTheme('everforest')"
  }
  use 'aklt/plantuml-syntax'
  use {
    'RRethy/vim-hexokinase',
    run = 'make hexokinase',
    setup = function()
      vim.g.Hexokinase_highlighters = {'virtual'}
    end
  }
  use {
    'ThePrimeagen/harpoon',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {'tree-sitter/tree-sitter'},
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'lua' },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        }
      }
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    requires = {'nvim-treesitter/nvim-treesitter'}
  }

  -- telescope {{{
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            hidden = true
          }
        }
      }
    end
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  -- }}}
  -- Language server protocol {{{
  use 'neovim/nvim-lspconfig'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
       'hrsh7th/cmp-nvim-lsp',
       'hrsh7th/cmp-buffer',
       'hrsh7th/cmp-path',
       'hrsh7th/cmp-cmdline'
    },
    config = function()
      local cmp = require('cmp')
      if cmp ~= nil then cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<c-y>'] = cmp.mapping.confirm {
            select = true
          }
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer', keyword_length = 5 },
          { name = 'path' }
        },
        experimental = {
          native_menu = false,
          ghost_text = true
        }
      })
      end
    end
  }
  -- }}}

  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({border = 'single'})
    end
  },
  profile = {
    enable = true,
    threshold = 1
  }
}})
