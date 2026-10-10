return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesitter-context').setup()
    for _, group in ipairs({ 'TreesitterContextBottom', 'TreesitterContextLineNumberBottom' }) do
      vim.cmd.highlight({ group, 'gui=underline guisp=Grey' })
    end
  end,
}
