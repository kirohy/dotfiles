local packer_group = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
  group = packer_group,
})

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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/dracula.nvim'
  use {
    'nvim-tree/nvim-web-devicons',
    tag = 'nerd-v2-compat',
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require('plugins.gitsigns-conf').config,
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = require('plugins.lualine-conf').config,
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = require('plugins.nvim-tree-conf').config,
  }
  use {
    'akinsho/nvim-bufferline.lua',
    tag = '*',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = require('plugins.bufferline-conf').config,
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.*',
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
    config = require('plugins.nvim-autopairs-conf').config,
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

  if packer_bootstrap then
    require('packer').sync()
  end
end)

