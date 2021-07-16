local M = {}

function M.config()
	require('nvim-autopairs').setup {
		check_ts = true,
		enable_check_bracket_line = true,
	}
	require("nvim-autopairs.completion.compe").setup {
		map_cr = true,
		map_complete = true,
	}
end

return M
