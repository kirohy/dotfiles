local M = {}

function M.config()
  require('bufferline').setup({
    options = {
      numbers = "none",
      indicator_icon = '▎',
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 25,
      max_prefix_length = 15,
      tab_size = 25,
      diagnostics = "nvim_lsp",
      offsets = {{filetype = "NvimTree", text = "NvimTree", text_align = "center"}},
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
    }
  })
  vim.api.nvim_set_keymap('n', '<C-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<A-h>', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<A-l>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<Leader>bc', ':BufferLinePickClose<CR>', { noremap = true, silent = true })

  function _G.BufdeleteCurrent()
    local buf_num = vim.api.nvim_eval([[bufnr('%')]])
    vim.api.nvim_command([[BufferLineCyclePrev]])
    -- vim.api.nvim_command('bdelete! ')
    require('bufferline').handle_close(buf_num)
  end
  vim.api.nvim_set_keymap('n', '<Leader>bd', [[<Cmd>lua BufdeleteCurrent()<CR>]], { noremap = true, silent = true })
end

return M
