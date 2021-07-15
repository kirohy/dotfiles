" dein.vim
if &compatible
  set nocompatible
endif

let mapleader = "\<Space>"
let s:nvim_dir = expand('~/.config/nvim')
let s:dein_dir = expand('~/.cache/dein')
let s:toml_dir = s:nvim_dir . '/rc'
let s:toml_base = s:toml_dir . '/dein.toml'
let s:toml_lazy = s:toml_dir . '/dein_lazy.toml'

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_base, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

filetype plugin indent on
syntax enable

let g:python3_host_prog = s:nvim_dir . '/venv/bin/python3'

" basic
set autoread
set autoindent
set hidden
set nobackup
set noswapfile
set nowritebackup
set smartindent

" looks
set cursorline
set encoding=utf-8
set laststatus=2
set noshowmode
set number
set showcmd
set showmatch
"set visualbell t_vb=
set wildmenu
set splitbelow
set termguicolors
set pumblend=10
"let g:terminal_color_0  ="#21222c" "black
"let g:terminal_color_1  ="#ff5555" "red
"let g:terminal_color_2  ="#50fa7b" "green
"let g:terminal_color_3  ="#f1fa8c" "yellow
"let g:terminal_color_4  ="#bd93f9" "blue
"let g:terminal_color_5  ="#ff79c6" "magenta
"let g:terminal_color_6  ="#8be9fd" "cyan
"let g:terminal_color_7  ="#f8f8f2" "white
"let g:terminal_color_8  ="#6272a4" "bright black
"let g:terminal_color_9  ="#ff6e6e" "bright red
"let g:terminal_color_10 ="#69ff94" "bright green
"let g:terminal_color_11 ="#ffffa5" "bright yellow
"let g:terminal_color_12 ="#d6acff" "bright blue
"let g:terminal_color_13 ="#ff92df" "bright magenta
"let g:terminal_color_14 ="#a4ffff" "bright cyan
"let g:terminal_color_15 ="#ffffff" "bright white
"let g:terminal_color_background="#282a36" "background
"let g:terminal_color_foreground="#f8f8f2" "foreground

" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan

" tab
set expandtab
set tabstop=4
set shiftwidth=4

" filetype
autocmd BufNewFile,BufRead *.l set filetype=lisp
autocmd BufNewFile,BufRead *.launch set filetype=xml
autocmd BufNewFile,BufRead *.body set filetype=yaml
autocmd BufNewFile,BufRead *.cnoid set filetype=yaml

" keymap
runtime! ./keymap.vim