vim.cmd('filetype pluginindent on')

vim.o.encoding = 'UTF-8'
vim.o.autoread = true
vim.o.hidden = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false

vim.wo.cursorline = true
vim.wo.number = true
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

vim.bo.autoindent = true
vim.bo.smartindent = true
vim.bo.expandtab = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

vim.g.mapleader = ' '

vim.cmd([[
autocmd BufNewFile,BufRead *.l set filetype=lisp
autocmd BufNewFile,BufRead *.launch set filetype=xml
autocmd BufNewFile,BufRead *.body set filetype=yaml
autocmd BufNewFile,BufRead *.cnoid set filetype=yaml
]])

vim.g.python3_host_prog = vim.env.HOME .. '/.config/nvim/venv/bin/python3'
