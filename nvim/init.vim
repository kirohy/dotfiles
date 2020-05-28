" dein.vim
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:toml_dir = expand('~/.config/nvim/rc')
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

let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim/bin/python'

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
set visualbell t_vb=
set wildmenu
set splitbelow
set termguicolors

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

" keymap
source ~/.config/nvim/keymap.vim
