vim.o.swapfile = false
vim.o.writebackup = false

vim.wo.cursorline = true
vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.o.cmdheight = 1
vim.o.showmode = false
vim.o.showmatch = true
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.pumblend = 10

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.updatetime = 250

vim.opt.clipboard:append({ 'unnamedplus' })

vim.g.mapleader = ' '
vim.g.python3_host_prog = vim.fn.stdpath('config') .. '/venv/bin/python3'
vim.g.lisp_rainbow = true

vim.filetype.add({
  extension = {
    l = 'commonlisp',
    launch = 'xml',
    tex = 'tex',
    body = 'yaml',
    cnoid = 'yaml',
    rosinstall = 'yaml',
  },
})

local group = vim.api.nvim_create_augroup('CoreSettings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = { 'commonlisp', 'lua', 'xml', 'yaml', 'cmake', 'vrml', 'sh', 'tex', 'bib' },
  callback = function(args)
    vim.bo[args.buf].tabstop = 2
    vim.bo[args.buf].expandtab = true
    vim.bo[args.buf].shiftwidth = 2
  end,
})

local commentstrings = {
  c = '// %s',
  cpp = '// %s',
  commonlisp = ';; %s',
  lisp = ';; %s',
  xml = '<!-- %s -->',
  vrml = '# %s',
}

vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = vim.tbl_keys(commentstrings),
  callback = function(args)
    vim.bo[args.buf].commentstring = commentstrings[args.match]
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = group,
  callback = function()
    vim.wo.number = false
    vim.wo.spell = false
  end,
})
