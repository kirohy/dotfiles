return {
  'nvim-telescope/telescope.nvim',
  version = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = { '<Leader>fb', '<Leader>ff', '<Leader>fc', '<Leader>fs', '<Leader>fg' },
  config = function()
    local actions = require('telescope.actions')

    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<ESC>'] = actions.close,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<TAB>'] = actions.toggle_selection + actions.move_selection_next,
          },
        },
      },
    })

    local builtin = require('telescope.builtin')
    for key, action in pairs({
      ['<Leader>fb'] = builtin.buffers,
      ['<Leader>ff'] = builtin.find_files,
      ['<Leader>fc'] = builtin.current_buffer_fuzzy_find,
      ['<Leader>fs'] = builtin.live_grep,
      ['<Leader>fg'] = builtin.git_status,
    }) do
      vim.keymap.set('n', key, action, { silent = true })
    end
  end,
}
