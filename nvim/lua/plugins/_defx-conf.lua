local options = {
  winwidth =  '40',
  split = 'vertical',
  direction = 'topleft',
  columns = 'indent:git:icons:filename',
  show_ignored_files = '1',
  toggle = '1'
}

for key, val in pairs(options) do
  vim.fn['defx#custom#option']('_', key, val)
end

vim.cmd('autocmd FileType defx lua DefxMySettings()')

function DefxMySettings()
  vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', [[defx#do_action('drop')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'c', [[defx#do_action('copy')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'm', [[defx#do_action('move')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'p', [[defx#do_action('paste')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'l', [[defx#is_directory() ? defx#do_action('open_tree') : defx#do_action('drop')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'E', [[defx#do_action('open', 'vsplit')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'P', [[defx#do_action('preview')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'o', [[defx#do_action('open_tree', 'toggle')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'K', [[defx#do_action('new_directory')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'N', [[defx#do_action('new_file')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'M', [[defx#do_action('new_multiple_files')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'C', [[defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'S', [[defx#do_action('toggle_sort', 'time')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'd', [[defx#do_action('remove')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'r', [[defx#do_action('rename')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '!', [[defx#do_action('execute_command')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'x', [[defx#do_action('execute_system')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'yy', [[defx#do_action('yank_path')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '.', [[defx#do_action('toggle_ignored_files')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', ';', [[defx#do_action('repeat')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'h', [[defx#is_opened_tree() ? defx#do_action('close_tree') : defx#do_action('cd', ['..'])]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '~', [[defx#do_action('cd')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'q', [[defx#do_action('quit')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<Space>', [[defx#do_action('toggle_select') . 'j']], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '*', [[defx#do_action('toggle_select_all')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'j', [[line('.') == line('$') ? 'gg' : 'j']], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'k', [[line('.') == 1 ? 'G' : 'k']], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<C-l>', [[defx#do_action('redraw')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<C-g>', [[defx#do_action('print')]], { noremap = true, silent = true, expr = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'cd', [[defx#do_action('change_vim_cwd')]], { noremap = true, silent = true, expr = true })
end

vim.api.nvim_set_keymap('n', '<Leader>df', ':<C-u>Defx<CR>', { noremap = true, silent = true })
