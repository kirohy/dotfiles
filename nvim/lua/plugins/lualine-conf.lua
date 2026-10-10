return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'dracula-nvim',
    },
    sections = {
      lualine_b = { 'branch', 'diff' },
      lualine_x = {
        { 'diagnostics', sources = { 'nvim_diagnostic' } },
      },
      lualine_y = { 'encoding', 'fileformat', 'filetype' },
      lualine_z = { 'progress', 'location' },
    },
    extensions = { 'nvim-tree' },
  },
}
