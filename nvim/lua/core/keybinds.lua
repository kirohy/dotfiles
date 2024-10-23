local keymap_opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', keymap_opts)
vim.keymap.set('n', ';', ':', keymap_opts)
vim.keymap.set('n', 'j', 'gj', keymap_opts)
vim.keymap.set('v', 'j', 'gj', keymap_opts)
vim.keymap.set('n', 'k', 'gk', keymap_opts)
vim.keymap.set('v', 'k', 'gk', keymap_opts)
vim.keymap.set('n', '<Leader>cl', ':close<CR>', keymap_opts)
vim.keymap.set('n', '<Leader>w', ':w<CR>', keymap_opts)
vim.keymap.set('n', '<Leader>q', ':q<CR>', keymap_opts)
vim.keymap.set('n', '<Leader>tn', ':enew<CR>:term<CR>', keymap_opts)
vim.keymap.set('n', '<Leader>th', ':new<CR>:term<CR>', keymap_opts)
vim.keymap.set('n', '<Leader>tv', ':vnew<CR>:term<CR>', keymap_opts)
vim.keymap.set('i', 'jj', '<ESC>', keymap_opts)
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], keymap_opts)

vim.keymap.set('n', '<Leader>co', 'gcc', { remap = true })
vim.keymap.set('v', '<Leader>co', 'gc', { remap = true })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lisp',
  callback = function()
    vim.bo.commentstring = ';; %s'
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'xml',
  callback = function()
    vim.bo.commentstring = '<!-- %s -->'
  end,
})
