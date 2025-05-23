vim.o.encoding = 'UTF-8'
vim.o.autoread = true
vim.o.hidden = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false

vim.wo.cursorline = true
vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.o.cmdheight = 0
vim.o.laststatus = 2
vim.o.showmode = false
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.visualbell = false
vim.o.wildmenu = true
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.pumblend = 10

vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrapscan = true

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.updatetime = 250

vim.opt.clipboard:append({ 'unnamedplus' })

vim.g.mapleader = ' '
vim.g.python3_host_prog = vim.env.HOME .. '/.config/nvim/venv/bin/python3'

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.l', command = 'set filetype=commonlisp' })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.launch', command = 'set filetype=xml' })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.tex', command = 'set filetype=tex' })
vim.api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  { pattern = { '*.body', '*.cnoid', '*.rosinstall' }, command = 'set filetype=yaml' }
)
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'commonlisp', 'lua', 'xml', 'yaml', 'cmake', 'vrml', 'sh', 'tex', 'bib' },
  command = 'setlocal tabstop=2 expandtab shiftwidth=2',
})
-- vim.api.nvim_create_autocmd('FileType', { pattern = 'tex', command = 'setlocal spell spelllang=en_us' })
vim.api.nvim_create_autocmd('TermOpen', { command = 'setlocal nonumber' })
vim.api.nvim_create_autocmd('TermOpen', { command = 'setlocal nospell' })

vim.g.lisp_rainbow = true

