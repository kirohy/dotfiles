local parsers = {
  'cpp',
  'c',
  'cmake',
  'json',
  'lua',
  'python',
  'rust',
  'toml',
  'yaml',
  'vimdoc',
  'commonlisp',
  'regex',
  'bash',
}

local filetypes = vim.list_extend(vim.deepcopy(parsers), { 'sh' })

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = function()
    local treesitter = require('nvim-treesitter')
    treesitter.setup({
      install_dir = vim.fn.stdpath('data') .. '/site',
    })
    treesitter.update(parsers):wait(300000)
  end,
  config = function()
    local treesitter = require('nvim-treesitter')

    treesitter.setup({
      install_dir = vim.fn.stdpath('data') .. '/site',
    })
    vim.treesitter.language.register('bash', 'sh')

    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function()
        local ok = pcall(vim.treesitter.start)
        if not ok then
          return
        end
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
