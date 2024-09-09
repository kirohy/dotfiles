return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesitter-context').setup()
    vim.cmd.highlight({ 'TreesitterContextBottom', 'gui=underline guisp=Grey' })
    vim.cmd.highlight({ 'TreesitterContextLineNumberBottom', 'gui=underline guisp=Grey' })
  end,
}
