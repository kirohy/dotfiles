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
imap <silent> jj <ESC>
imap {<CR> {}<Left><CR><Esc><S-o>
imap {<Space> {}<Left>
imap [ []<Left>
imap ( ()<Left>
imap "<Space> ""<Left>
imap '<Space> ''<Left>
tmap <Esc> <C-\><C-n>

" xml comment in - out
nmap <silent> <Leader>co :s/</<!--<Space>/<CR>:s/>/<Space>-->/<CR>:nohlsearch<CR>
nmap <silent> <Leader>ci :s/\(!--<Space>\\|<Space>--\)//g<CR>:nohlsearch<CR>
vmap <silent> <Leader>co <Esc>`>i<Space>--<Esc>`<a!--<Space><Esc>
vmap <silent> <Leader>ci :s/\(!--<Space>\\|<Space>--\)//g<CR>:nohlsearch<CR>

" defx
nmap <silent> <Leader>df :<C-u>Defx<CR>:set<Space>nonumber<CR>

" denite
nmap <silent> <leader>f :<C-u>DeniteProjectDir -start-filter file/rec<CR>
nmap <silent> <leader>g :<C-u>DeniteProjectDir grep<CR>
