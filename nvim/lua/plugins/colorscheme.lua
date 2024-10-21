return {
  'Mofiqul/dracula.nvim',
  config = function ()
    vim.cmd.colorscheme('dracula')
    vim.cmd('syntax enable')
    vim.cmd.highlight({ 'Normal', 'ctermbg=NONE guibg=NONE' })
    vim.cmd.highlight({ 'NonText', 'ctermbg=NONE guibg=NONE' })
    vim.cmd.highlight({ 'LineNr', 'ctermbg=NONE guibg=NONE' })
    vim.cmd.highlight({ 'Folded', 'ctermbg=NONE guibg=NONE' })
    vim.cmd.highlight({ 'EndOfBuffer', 'ctermbg=NONE guibg=NONE' })
    vim.cmd.highlight({ 'SignColumn', 'ctermbg=NONE guibg=NONE' })
  end,
}
