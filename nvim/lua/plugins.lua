local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
  	'Mofiqul/dracula.nvim',
  	config = vim.cmd([[colorscheme dracula]])
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require('plugins.gitsigns-conf').config
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true  },
    config = require('plugins.nvim-tree-conf').config
  }
  use {
    'akinsho/nvim-bufferline.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require('plugins.bufferline-conf').config
  }
  use {
    'jpalardy/vim-slime',
    opt = true,
    ft = { 'python', 'lisp' },
    config = require('plugins.vim-slime-conf').config
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = require('plugins.telescope-conf').config
  }
  use {
    'neovim/nvim-lspconfig',
    config = require('plugins.nvim-lspconfig-conf').config
  }
  use {
    'hrsh7th/nvim-compe',
  }
  use {
    'L3MON4D3/LuaSnip',
    config = require('plugins.nvim-compe-conf').config
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require('plugins.lualine-conf').config
  }
end)

