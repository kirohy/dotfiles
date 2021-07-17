vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':bnext<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>bd', ':bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>cl', ':close<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>re', [[:%s;\<<C-R><C-W>\>;g<Left><Left>;]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tn', ':enew<CR>:term<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>th', ':new<CR>:term<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tv', ':vnew<CR>:term<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', [["]], [[""<Left>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', [[']], [[''<Left>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- xml comment
vim.cmd('autocmd FileType xml lua XmlCommentout()')
function XmlCommentout()
  vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>co', [[:s/</<!--<Space></<CR>:s/>/><Space>-->/<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ci', [[:s/<!--<Space>//<CR>:s/<Space>-->//<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>co', [[:s/\(\S.\{-}\)\ze\n/<!-- \1 -->/<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>ci', [[:s/\(<!--<Space>\|<Space>-->\)//g<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
end

-- c, cpp comment
vim.cmd('autocmd FileType c,cpp lua CxxCommentout()')
function CxxCommentout()
  vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>co', [[:s/\(\S\)/\/\/ \1/<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ci', [[:s/\/\/<Space>//<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>co', [[:s/\(\S\)/\/\/ \1/<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>ci', [[:s/\/\/<Space>//<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
end

-- python, cmake, yaml, toml comment
vim.cmd('autocmd FileType python,cmake,yaml,toml lua PythonCommentout()')
function PythonCommentout()
  vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>co', [[:s/\(\S\)/# \1/<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ci', [[:s/#<Space>//<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>co', [[:s/\(\S\)/# \1/<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>ci', [[:s/#<Space>//<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
end

-- lisp comment
vim.cmd('autocmd FileType lisp lua LispCommentout()')
function LispCommentout()
  vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>co', [[:s/\(\S\)/;; \1/<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ci', [[:s/;;<Space>//<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>co', [[:s/\(\S\)/;; \1/<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>ci', [[:s/;;<Space>//<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
end

-- lua comment
vim.cmd('autocmd FileType lua lua LuaCommentout()')
function LuaCommentout()
  vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>co', [[:s/\(\S\)/-- \1/<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ci', [[:s/--<Space>//<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>co', [[:s/\(\S\)/-- \1/<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>ci', [[:s/--<Space>//<CR>:nohlsearch<CR>]], { noremap = true, silent = true })
end
