local M = {}

function M.config()
  vim.cmd.highlight({'NvimTreeNormal', 'ctermbg=NONE guibg=NONE'})
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'NvimTree',
    callback = function ()
      vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
    end
  })
  vim.api.nvim_set_keymap('n', '<Leader>ex', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<Leader>tr', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

  local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  require('nvim-tree').setup{
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
      special_files = { 'README.md', 'Makefile', 'CMakeLists.txt'},
    },
    view = {
      width = 40,
      side = 'left',
      mappings = {
        list = {
          { key = {'o', 'l'}, cb = tree_cb('edit') },
          { key = '<CR>',     cb = tree_cb('cd') },
          { key = '<C-v>',    cb = tree_cb('vsplit') },
          { key = '<C-x>',    cb = tree_cb('split') },
          { key = '<C-t>',    cb = tree_cb('tabnew') },
          { key = '<',        cb = tree_cb('prev_sibling') },
          { key = '>',        cb = tree_cb('next_sibling') },
          { key = 'P',        cb = tree_cb('parent_node') },
          { key = 'h',        cb = tree_cb('close_node') },
          { key = '<S-CR>',   cb = tree_cb('close_node') },
          { key = '<Tab>',    cb = tree_cb('preview') },
          { key = 'K',        cb = tree_cb('first_sibling') },
          { key = 'J',        cb = tree_cb('last_sibling') },
          { key = 'I',        cb = tree_cb('toggle_ignored') },
          { key = 'H',        cb = tree_cb('toggle_dotfiles') },
          { key = 'R',        cb = tree_cb('refresh') },
          { key = 'a',        cb = tree_cb('create') },
          { key = 'd',        cb = tree_cb('remove') },
          { key = 'r',        cb = tree_cb('rename') },
          { key = '<C-r>',    cb = tree_cb('full_rename') },
          { key = 'x',        cb = tree_cb('cut') },
          { key = 'c',        cb = tree_cb('copy') },
          { key = 'p',        cb = tree_cb('paste') },
          { key = 'y',        cb = tree_cb('copy_name') },
          { key = 'Y',        cb = tree_cb('copy_path') },
          { key = 'gy',       cb = tree_cb('copy_absolute_path') },
          { key = '[c',       cb = tree_cb('prev_git_item') },
          { key = ']c',       cb = tree_cb('next_git_item') },
          { key = '-',        cb = tree_cb('dir_up') },
          { key = 'q',        cb = tree_cb('close') },
          { key = 'g?',       cb = tree_cb('toggle_help') },
        }
      }
    }
  }
end

return M
