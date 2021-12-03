vim.o.encoding = 'UTF-8'
vim.o.autoread = true
vim.o.hidden = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false

vim.wo.cursorline = true
vim.wo.number = true
vim.wo.signcolumn = 'yes'
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

vim.g.mapleader = ' '
vim.g.python3_host_prog = vim.env.HOME .. '/.config/nvim/venv/bin/python3'

vim.cmd([[
autocmd BufNewFile,BufRead *.l set filetype=lisp
autocmd BufNewFile,BufRead *.launch set filetype=xml
autocmd BufNewFile,BufRead *.body set filetype=yaml
autocmd BufNewFile,BufRead *.cnoid set filetype=yaml
autocmd FileType lisp,lua,xml,yaml,cmake,vrml,sh setlocal tabstop=2 expandtab shiftwidth=2
]])

vim.cmd([[
syntax enable
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
]])

vim.cmd([[autocmd TermOpen * setlocal nonumber]])
