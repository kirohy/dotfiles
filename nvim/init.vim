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
set pumblend=10
let g:terminal_color_0  = "#262626" "black
let g:terminal_color_1  = "#e356a7" "red
let g:terminal_color_2  = "#42e66c" "green
let g:terminal_color_3  = "#e4f34c" "yellow
let g:terminal_color_4  = "#9b6bdf" "blue
let g:terminal_color_5  = "#e64747" "magenta
let g:terminal_color_6  = "#75d7ec" "cyan
let g:terminal_color_7  = "#efa554" "white
let g:terminal_color_8  = "#7a7a7a" "bright black
let g:terminal_color_9  = "#ff79c6" "bright red
let g:terminal_color_10 = "#50fa7b" "bright green
let g:terminal_color_11 = "#f1fa8c" "bright yellow
let g:terminal_color_12 = "#bd93f9" "bright blue
let g:terminal_color_13 = "#ff5555" "bright magenta
let g:terminal_color_14 = "#8be9fd" "bright cyan
let g:terminal_color_15 = "#ffb86c" "bright white
let g:terminal_color_background="#282a36" "background
let g:terminal_color_foreground="#f8f8f2" "foreground

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
