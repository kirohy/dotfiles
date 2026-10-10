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
  opts = {
    -- Prepend the parser directory so its queries take precedence.
    install_dir = vim.fn.stdpath('data') .. '/site',
  },
  build = function(plugin)
    local treesitter = require('nvim-treesitter')
    treesitter.setup(plugin.opts)
    treesitter.update(parsers):wait(300000)
  end,
  config = function(_, opts)
    local treesitter = require('nvim-treesitter')

    treesitter.setup(opts)
    vim.treesitter.language.register('bash', 'sh')

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('TreesitterConfig', { clear = true }),
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
