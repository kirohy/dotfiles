local M = {}

function M.config()
  local actions = require('telescope.actions')

	require('telescope').setup {
	  defaults = {
	    mappings = {
	      i = {
					['<ESC>'] = actions.close,
	        ['<C-j>'] = actions.move_selection_next,
	        ['<C-k>'] = actions.move_selection_previous,
					['<TAB>'] = actions.toggle_selection + actions.move_selection_next,
	      },
	    },
	  },
	}

	vim.api.nvim_set_keymap('n', '<Leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<Leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<Leader>fc', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<Leader>fs', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<Leader>fg', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })
end

return M
