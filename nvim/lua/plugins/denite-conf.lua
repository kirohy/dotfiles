vim.cmd('autocmd FileType denite lua denite_my_settings()')

function denite_my_settings()
    vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', [[denite#do_map('do_action')]], { noremap = true, silent = true, expr = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'd', [[denite#do_map('do_action', 'delete')]], { noremap = true, silent = true, expr = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'p', [[denite#do_map('do_action', 'preview')]], { noremap = true, silent = true, expr = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'q', [[denite#do_map('quit')]], { noremap = true, silent = true, expr = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'i', [[denite#do_map('open_filter_buffer')]], { noremap = true, silent = true, expr = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<Space>', [[denite#do_map('toggle_select').'j']], { noremap = true, silent = true, expr = true })
end

vim.fn['denite#custom#option']('default', 'split', 'floating')

vim.api.nvim_set_keymap('n', '<Leader>f', ':<C-u>DeniteProjectDir -start-filter file/rec<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>g', ':<C-u>DeniteProjectDir grep<CR>', { noremap = true, silent = true })
