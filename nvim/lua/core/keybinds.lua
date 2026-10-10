local keymap_opts = { silent = true }

vim.keymap.set('n', '<Esc><Esc>', '<Cmd>nohlsearch<CR>', keymap_opts)
vim.keymap.set('n', ';', ':', keymap_opts)
vim.keymap.set({ 'n', 'v' }, 'j', 'gj', keymap_opts)
vim.keymap.set({ 'n', 'v' }, 'k', 'gk', keymap_opts)
vim.keymap.set('n', '<Leader>cl', '<Cmd>close<CR>', keymap_opts)
vim.keymap.set('n', '<Leader>w', '<Cmd>write<CR>', keymap_opts)
vim.keymap.set('n', '<Leader>q', '<Cmd>quit<CR>', keymap_opts)
vim.keymap.set('n', '<Leader>tn', '<Cmd>enew<CR><Cmd>terminal<CR>', keymap_opts)
vim.keymap.set('n', '<Leader>th', '<Cmd>new<CR><Cmd>terminal<CR>', keymap_opts)
vim.keymap.set('n', '<Leader>tv', '<Cmd>vnew<CR><Cmd>terminal<CR>', keymap_opts)
vim.keymap.set('i', 'jj', '<ESC>', keymap_opts)
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], keymap_opts)

vim.keymap.set('n', '<Leader>co', 'gcc', { remap = true })
vim.keymap.set('v', '<Leader>co', 'gc', { remap = true })
