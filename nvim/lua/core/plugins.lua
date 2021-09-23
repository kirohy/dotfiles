local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local use = require('packer').use
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'Mofiqul/dracula.nvim',
    config = vim.cmd([[colorscheme dracula]]),
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require('plugins.gitsigns-conf').config,
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require('plugins.lualine-conf').config,
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true  },
    config = require('plugins.nvim-tree-conf').config,
  }
  use {
    'akinsho/nvim-bufferline.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require('plugins.bufferline-conf').config,
  }
  use {
    'jpalardy/vim-slime',
    opt = true,
    ft = { 'python', 'lisp' },
    config = require('plugins.vim-slime-conf').config,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = require('plugins.telescope-conf').config,
  }
  use {
    'neovim/nvim-lspconfig',
    config = require('plugins.nvim-lspconfig-conf').config,
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {{ 'hrsh7th/cmp-nvim-lsp' }, { 'saadparwaiz1/cmp_luasnip' }, { 'L3MON4D3/LuaSnip' }, { 'hrsh7th/cmp-buffer' }, { 'hrsh7th/cmp-path' }},
    config = require('plugins.nvim-cmp-conf').config
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    config = require('plugins.nvim-treesitter-conf').config,
    run = ':TSUpdate',
  }
  use {
    'windwp/nvim-autopairs',
    config = require('plugins.nvim-autopairs').config,
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() vim.g.indent_blankline_char = '│' end,
  }
  use 'vim-denops/denops.vim'
  use 'lambdalisue/guise.vim'
end)

