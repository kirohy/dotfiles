return {
  'akinsho/nvim-bufferline.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  version = '*',
  lazy = false,
  keys = {
    { '<C-h>', '<cmd>BufferLineCyclePrev<CR>', noremap = true, silent = true },
    { '<C-l>', '<cmd>BufferLineCycleNext<CR>', noremap = true, silent = true },
    { '<A-l>', '<cmd>BufferLineMovePrev<CR>', noremap = true, silent = true },
    { '<A-l>', '<cmd>BufferLineMoveNext<CR>', noremap = true, silent = true },
    { '<Leader>bc', '<cmd>BufferLinePickClose<CR>', noremap = true, silent = true },
  },
  config = function()
    require('bufferline').setup({
      options = {
        numbers = 'none',
        indicator = {
          icon = '▎',
          style = 'icon',
        },
        max_name_length = 25,
        max_prefix_length = 15,
        tab_size = 25,
        diagnostics = 'nvim_lsp',
        offsets = { { filetype = 'NvimTree', text = 'NvimTree', text_align = 'center' } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = 'thin',
        enforce_regular_tabs = false,
        always_show_bufferline = true,
      },
    })
    function _G.BufdeleteCurrent()
      local buf_num = vim.api.nvim_get_current_buf()
      vim.api.nvim_command([[BufferLineCyclePrev]])
      vim.api.nvim_command(string.format('bdelete! %d', buf_num))
    end
    vim.keymap.set('n', '<Leader>bd', [[<Cmd>lua BufdeleteCurrent()<CR>]], { noremap = true, silent = true })
  end,
}
