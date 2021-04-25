let mapleader = "\<Space>"
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nmap ; :
nmap j gj
vmap j gj
nmap k gk
vmap k gk
nmap <C-h> :bprev <CR>
nmap <C-l> :bnext<CR>
nmap <Leader>bd :BD<CR>
nmap <Leader>cl :close<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;
nmap <Leader>ide :13split<CR>:term<CR>:set nonumber<CR><C-w><C-w>:NERDTreeToggle<CR>I<C-w><C-w>
imap <silent> jj <ESC>
imap {<CR> {}<Left><CR><Esc><S-o>
imap {<Space> {}<Left>
imap [ []<Left>
imap ( ()<Left>
imap "<Space> ""<Left>
imap '<Space> ''<Left>
tmap <Esc> <C-\><C-n>

" xml comment in - out
nmap <Leader>co :s/</<!--<Space>/<CR>:s/>/<Space>-->/<CR>:nohlsearch<CR>
nmap <Leader>ci :s/\(!--<Space>\\|<Space>--\)//g<CR>:nohlsearch<CR>
vmap <Leader>co <Esc>`>i<Space>--<Esc>`<a!--<Space><Esc>
vmap <Leader>ci :s/\(!--<Space>\\|<Space>--\)//g<CR>:nohlsearch<CR>

" defx
nmap <Leader>f :Defx<CR>:set<Space>nonumber<CR>
