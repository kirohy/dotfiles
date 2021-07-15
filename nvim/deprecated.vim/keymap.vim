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
nmap <silent> <Leader>tn :enew<CR>:term<CR>
nmap <silent> <Leader>th :new<CR>:term<CR>
nmap <silent> <Leader>tv :vnew<CR>:term<CR>
imap <silent> jj <ESC>
imap {<CR> {}<Left><CR><Esc><S-o>
imap {<Space> {}<Left>
imap [ []<Left>
imap ( ()<Left>
imap "<Space> ""<Left>
imap '<Space> ''<Left>
tmap <Esc> <C-\><C-n>

" xml comment in - out
nmap <silent> <Leader>co :s/</<!--<Space></<CR>:s/>/><Space>-->/<CR>:nohlsearch<CR>
nmap <silent> <Leader>ci :s/<!--<Space>//<CR>:s/<Space>-->//<CR>:nohlsearch<CR>
vmap <silent> <Leader>co :s/\(\S.\{-}\)\ze\n/<!-- \1 -->/<CR>:nohlsearch<CR>
vmap <silent> <Leader>ci :s/\(<!--<Space>\\|<Space>-->\)//g<CR>:nohlsearch<CR>
