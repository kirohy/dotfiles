local M = {}

function M.config()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'cpp', 'c', 'cmake', 'json', 'julia', 'lua', 'python', 'rust', 'toml', 'yaml', 'vimdoc' },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    autopairs = {
      enable = true,
    },
  })
end

return M
