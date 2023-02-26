local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command("packadd packer.nvim")
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/dracula.nvim'
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require('plugins.gitsigns-conf').config,
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = require('plugins.lualine-conf').config,
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = require('plugins.nvim-tree-conf').config,
  }
  use {
    'akinsho/nvim-bufferline.lua',
    tag = "v2.*",
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = require('plugins.bufferline-conf').config,
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
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' },
      { 'onsails/lspkind.nvim' }
    },
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
  use {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        copilot_node_command = vim.fn.expand('$HOME') .. '/.nodenv/versions/17.9.1/bin/node'
      })
    end,
  }
  use {
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function ()
      require('copilot_cmp').setup()
    end
  }
  use {
    'folke/noice.nvim',
    config = function ()
      require('noice').setup()
    end,
    requires = {
      { 'MunifTanjim/nui.nvim' },
      {
        'rcarriga/nvim-notify',
        config = function()
          require('notify').setup({
            background_colour = '#191A21',
          })
        end,
      },
    }
  }
  use {
    'voldikss/vim-floaterm',
    cmd = { 'FloatermNew', 'FloatermToggle' },
    config = function ()
      vim.api.nvim_create_autocmd('User', { pattern = 'FloatermOpen', command = 'tnoremap <buffer> <silent> <M-t> <C-\\><C-n>:FloatermToggle<CR>' })
      vim.api.nvim_create_autocmd('User', { pattern = 'FloatermOpen', command = 'tnoremap <buffer> <silent> <C-n> <C-\\><C-n>:FloatermNew<CR>' })
      vim.api.nvim_create_autocmd('User', { pattern = 'FloatermOpen', command = 'tnoremap <buffer> <silent> <C-h> <C-\\><C-n>:FloatermPrev<CR>' })
      vim.api.nvim_create_autocmd('User', { pattern = 'FloatermOpen', command = 'tnoremap <buffer> <silent> <C-l> <C-\\><C-n>:FloatermNext<CR>' })
      vim.api.nvim_create_autocmd('QuitPre', { command = 'FloatermKill!'})
    end
  }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

