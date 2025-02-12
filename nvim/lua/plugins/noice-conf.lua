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
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
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
