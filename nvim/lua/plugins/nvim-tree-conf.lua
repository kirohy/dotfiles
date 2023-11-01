local M = {}

function M.config()
  vim.cmd.highlight({ 'NvimTreeNormal', 'ctermbg=NONE guibg=NONE' })
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'NvimTree',
    callback = function()
      vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
    end,
  })
  vim.api.nvim_set_keymap('n', '<Leader>ex', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<Leader>tr', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

  local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<CR>', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  end

  require('nvim-tree').setup({
    on_attach = on_attach,
    diagnostics = {
      enable = true,
    },
    update_cwd = true,
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
      side = 'left',
    },
  })
end

return M
