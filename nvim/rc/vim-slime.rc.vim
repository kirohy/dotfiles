let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
let g:slime_dont_ask_default = 1

nmap <Leader>sl <Plug>SlimeLineSend
nmap <Leader>sr <Plug>SlimeParagraphSend
