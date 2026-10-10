return {
  'Mofiqul/dracula.nvim',
  config = function()
    vim.cmd.colorscheme('dracula')
    for _, group in ipairs({ 'Normal', 'NonText', 'LineNr', 'Folded', 'EndOfBuffer', 'SignColumn' }) do
      vim.cmd.highlight({ group, 'ctermbg=NONE guibg=NONE' })
    end
  end,
}
