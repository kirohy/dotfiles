local M = {}

function M.config()
  require('lualine').setup({
    options = {
      theme = 'dracula-nvim',
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        { 'branch' },
        { 'diff', color_added = '#69FF94', color_modified = '#8BE9FD', color_removed = '#FF6E6E' },
      },
      lualine_c = { 'filename' },
      lualine_x = {
        { 'diagnostics', sources = { 'nvim_diagnostic' } },
      },
      lualine_y = { 'encoding', 'fileformat', 'filetype' },
      lualine_z = { 'progress', 'location' },
    },
    extensions = { 'nvim-tree' },
  })
end

return M
