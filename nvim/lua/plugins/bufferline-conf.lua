return {
  'akinsho/nvim-bufferline.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  version = '*',
  lazy = false,
  keys = {
    { '<C-h>', '<cmd>BufferLineCyclePrev<CR>', silent = true },
    { '<C-l>', '<cmd>BufferLineCycleNext<CR>', silent = true },
    { '<A-h>', '<cmd>BufferLineMovePrev<CR>', silent = true },
    { '<A-l>', '<cmd>BufferLineMoveNext<CR>', silent = true },
    { '<Leader>bc', '<cmd>BufferLinePickClose<CR>', silent = true },
    {
      '<Leader>bd',
      function()
        local buf = vim.api.nvim_get_current_buf()
        vim.cmd.BufferLineCyclePrev()
        vim.api.nvim_buf_delete(buf, { force = true })
      end,
      silent = true,
    },
  },
  opts = {
    options = {
      indicator = {
        icon = '▎',
      },
      max_name_length = 25,
      tab_size = 25,
      diagnostics = 'nvim_lsp',
      offsets = { { filetype = 'NvimTree', text = 'NvimTree', text_align = 'center' } },
    },
  },
}
