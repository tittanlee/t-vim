
" let g:yankring_history_dir = g:copy_cache_dir

" let g:yankring_window_height = 10

" modify the file name of history
" let g:yankring_history_file = '.yankring_history'

" select the previous contents
let g:yankring_replace_n_pkey = '<M-S>p'

" select the next contents
let g:yankring_replace_n_nkey = '<M>p'

let g:yankring_zap_keys = ''

nmap <Leader>yy :YRShow<cr>
nmap <leader>yc :YRClear<cr>
