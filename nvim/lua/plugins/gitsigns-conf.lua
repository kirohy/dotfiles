return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
    },
    on_attach = function(bufnr)
      local gs = require('gitsigns')
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buf = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
      map('n', '<Leader>hn', function()
        if vim.wo.diff then
          return '<Leader>hn'
        end
        vim.schedule(function()
          gs.nav_hunk('next')
        end)
        return '<Ignore>'
      end, { expr = true })

      map('n', '<Leader>hp', function()
        if vim.wo.diff then
          return '<Leader>hp'
        end
        vim.schedule(function()
          gs.nav_hunk('prev')
        end)
        return '<Ignore>'
      end, { expr = true })
    end,
  },
}
