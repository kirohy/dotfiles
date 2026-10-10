return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<Leader>tr', '<cmd>NvimTreeToggle<CR>', silent = true },
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.cmd.highlight({ 'NvimTreeNormal', 'ctermbg=NONE guibg=NONE' })

    local function on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buf = bufnr, silent = true, nowait = true }
      end

      api.map.on_attach.default(bufnr)

      vim.keymap.set('n', '<Leader>r', api.tree.reload, { buf = bufnr, silent = true, desc = 'nvim-tree: Refresh' })
      vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<CR>', api.tree.change_root_to_node, opts('CD'))
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    end

    require('nvim-tree').setup({
      on_attach = on_attach,
      diagnostics = {
        enable = true,
      },
      sync_root_with_cwd = true,
      hijack_directories = {
        auto_open = false,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            folder_arrow = false,
          },
        },
        special_files = { 'README.md', 'Makefile', 'CMakeLists.txt' },
      },
      view = {
        width = 40,
      },
    })
  end,
}
