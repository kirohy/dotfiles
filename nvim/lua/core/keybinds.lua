local keymap_opts = { noremap = true, silent = true }

-- buitin
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', ';', ':', keymap_opts)
vim.api.nvim_set_keymap('n', 'j', 'gj', keymap_opts)
vim.api.nvim_set_keymap('v', 'j', 'gj', keymap_opts)
vim.api.nvim_set_keymap('n', 'k', 'gk', keymap_opts)
vim.api.nvim_set_keymap('v', 'k', 'gk', keymap_opts)
-- vim.api.nvim_set_keymap('n', '<C-h>', ':bprev<CR>', default_opts)
-- vim.api.nvim_set_keymap('n', '<C-l>', ':bnext<CR>', default_opts)
-- vim.api.nvim_set_keymap('n', '<Leader>bd', ':bdelete<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<Leader>cl', ':close<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<Leader>re', [[:%s;\<<C-R><C-W>\>;g<Left><Left>;]], keymap_opts)
vim.api.nvim_set_keymap('n', '<Leader>tn', ':enew<CR>:term<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<Leader>th', ':new<CR>:term<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<Leader>tv', ':vnew<CR>:term<CR>', keymap_opts)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', keymap_opts)
-- vim.api.nvim_set_keymap('i', '{', '{}<Left>', default_opts)
-- vim.api.nvim_set_keymap('i', '[', '[]<Left>', default_opts)
-- vim.api.nvim_set_keymap('i', '(', '()<Left>', default_opts)
-- vim.api.nvim_set_keymap('i', [["]], [[""<Left>]], default_opts)
-- vim.api.nvim_set_keymap('i', [[']], [[''<Left>]], default_opts)
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], keymap_opts)

-- xml comment
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'xml',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>co', [[:s/</<!--<Space></<CR>:s/>/><Space>-->/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ci', [[:s/<!--<Space>//<CR>:s/<Space>-->//<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>co', [[:s/\(\S.\{-}\)\ze\n/<!-- \1 -->/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>ci', [[:s/\(<!--<Space>\|<Space>-->\)//g<CR>:nohlsearch<CR>]], keymap_opts)
  end,
})

-- '/' comment
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c,cpp',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>co', [[:s/\(\S\)/\/\/ \1/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ci', [[:s/\/\/<Space>//<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>co', [[:s/\(\S\)/\/\/ \1/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>ci', [[:s/\/\/<Space>//<CR>:nohlsearch<CR>]], keymap_opts)
  end,
})

-- '#' comment
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'cmake', 'yaml', 'toml', 'sh' },
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>co', [[:s/\(\S\)/# \1/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ci', [[:s/#<Space>//<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>co', [[:s/\(\S\)/# \1/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>ci', [[:s/#<Space>//<CR>:nohlsearch<CR>]], keymap_opts)
  end,
})

-- ';;' comment
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lisp',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>co', [[:s/\(\S\)/;; \1/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ci', [[:s/;;<Space>//<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>co', [[:s/\(\S\)/;; \1/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>ci', [[:s/;;<Space>//<CR>:nohlsearch<CR>]], keymap_opts)
  end,
})

-- '--' comment
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>co', [[:s/\(\S\)/-- \1/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ci', [[:s/--<Space>//<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>co', [[:s/\(\S\)/-- \1/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>ci', [[:s/--<Space>//<CR>:nohlsearch<CR>]], keymap_opts)
  end,
})

-- '%' comment
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>co', [[:s/\(\S\)/% \1/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ci', [[:s/%<Space>//<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>co', [[:s/\(\S\)/% \1/<CR>:nohlsearch<CR>]], keymap_opts)
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>ci', [[:s/%<Space>//<CR>:nohlsearch<CR>]], keymap_opts)
  end,
})

-- plugin
vim.keymap.set('n', '<M-t>', ':FloatermToggle<CR>', keymap_opts)
