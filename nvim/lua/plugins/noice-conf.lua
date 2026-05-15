return {
  'folke/noice.nvim',
  dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
  event = 'VeryLazy',
  keys = {
    { '<Leader>lg', '<cmd>Noice<CR>', noremap = true, silent = true },
  },
  opts = {
    lsp = {
      override = {
        ['cmp.entry.get_documentation'] = true,
      },
    },
    commands = {
      history = {
        view = 'popup',
      },
    },
  },
}
