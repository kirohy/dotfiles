local M = {}

function M.config()
  vim.g.slime_target = 'tmux'
  vim.g.slime_paste_file = vim.env.HOME .. '/.slime_paste'
  vim.g.slime_default_config = { socket_name =  vim.fn.get(vim.fn.split(vim.env.TMUX, ','), 0), target_pane =  ':.1' }
  vim.g.slime_dont_ask_default = 1

  vim.api.nvim_set_keymap('n', '<Leader>sl', '<Plug>SlimeLineSend', { silent = true })
  vim.api.nvim_set_keymap('n', '<Leader>sr', '<Plug>SlimeParagraphLineSend', { silent = true })
end

return M
