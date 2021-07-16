function LspStatus()
  local error_count = vim.lsp.diagnostic.get_count(0, 'Error')
  local warning_count = vim.lsp.diagnostic.get_count(0, 'Warning')
  return 'W: ' .. warning_count .. ' E: ' .. error_count
end

require('lualine').setup({
  options = {
    theme = 'dracula-nvim',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch' },
      { 'diff', color_added = '#50FA7B' },
    },
    lualine_c = { 'filename' },
    -- lualine_x = { 'diagnostics', sources = { 'nvim_lsp' } },
    lualine_x = { "LspStatus()" },
    -- lualine_x = { 'progress' },
    lualine_y = { 'encoding', 'fileformat', 'filetype' },
    lualine_z = { 'location'}
  },
	extensions = { 'nvim-tree' },
})

