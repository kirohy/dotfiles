local M = {}

function M.config()
  vim.g.nvim_tree_icon_padding = ' '
  vim.cmd([[let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile':  1, 'CMakeLists.txt': 1 }]])
  vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 0,
  }
  vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = '✗',
      taged = '✓',
      unmerged = '',
      renamed = '➜',
      untracked = '★',
      deleted = '',
      ignored = '◌'
    },
    folder = {
      arrow_open = '',
      arrow_closed = '',
      default = '',
      open = '',
      empty = '',
      empty_open = '',
      symlink = '',
      symlink_open = '',
    },
    lsp = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    }
  }

  vim.cmd('highlight NvimTreeNormal ctermbg=NONE guibg=NONE')
  vim.cmd('autocmd FileType NvimTree lua NvimTree_my_settings()')
  function NvimTree_my_settings()
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
  end
  vim.api.nvim_set_keymap('n', '<Leader>tr', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  -- vim.cmd([[autocmd VimEnter * exe "term" | setlocal nonumber | NvimTreeOpen]])

  local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  require('nvim-tree').setup{
    disable_netrw = false,
    hijack_netrw = false,
    diagnostics = {
      enable = true,
    },
    update_cwd = true,
    actions = {
      open_file = {
        quit_on_open = false,
        window_picker = {
          enable = false,
        }
      }
    },
    hijack_directories = {
      auto_open = false,
    },
    renderer = {
      indent_markers = {
        enable = true,
      }
    },
    view = {
      width = 40,
      side = 'left',
      mappings = {
        list = {
          { key = {"o", "l"}, cb = tree_cb("edit") },
          { key = "<CR>",     cb = tree_cb("cd") },
          { key = "<C-v>",    cb = tree_cb("vsplit") },
          { key = "<C-x>",    cb = tree_cb("split") },
          { key = "<C-t>",    cb = tree_cb("tabnew") },
          { key = "<",        cb = tree_cb("prev_sibling") },
          { key = ">",        cb = tree_cb("next_sibling") },
          { key = "P",        cb = tree_cb("parent_node") },
          { key = "h",     		cb = tree_cb("close_node") },
          { key = "<S-CR>",   cb = tree_cb("close_node") },
          { key = "<Tab>",    cb = tree_cb("preview") },
          { key = "K",        cb = tree_cb("first_sibling") },
          { key = "J",        cb = tree_cb("last_sibling") },
          { key = "I",        cb = tree_cb("toggle_ignored") },
          { key = "H",        cb = tree_cb("toggle_dotfiles") },
          { key = "R",        cb = tree_cb("refresh") },
          { key = "a",        cb = tree_cb("create") },
          { key = "d",        cb = tree_cb("remove") },
          { key = "r",        cb = tree_cb("rename") },
          { key = "<C-r>",    cb = tree_cb("full_rename") },
          { key = "x",        cb = tree_cb("cut") },
          { key = "c",        cb = tree_cb("copy") },
          { key = "p",        cb = tree_cb("paste") },
          { key = "y",        cb = tree_cb("copy_name") },
          { key = "Y",        cb = tree_cb("copy_path") },
          { key = "gy",       cb = tree_cb("copy_absolute_path") },
          { key = "[c",       cb = tree_cb("prev_git_item") },
          { key = "]c",       cb = tree_cb("next_git_item") },
          { key = "-",        cb = tree_cb("dir_up") },
          { key = "q",        cb = tree_cb("close") },
          { key = "g?",       cb = tree_cb("toggle_help") },
        }
      }
    }
  }
end

return M
