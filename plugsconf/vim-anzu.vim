" mapping
nmap n <Plug>(anzu-n-with-echo)<Plug>(anzu-sign-matchline)
nmap N <Plug>(anzu-N-with-echo)<Plug>(anzu-sign-matchline)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)


" statusline
set statusline=%{anzu#search_status()}


" if start anzu-mode key mapping
" anzu-mode is anzu(12/51) in screen
" nmap n <Plug>(anzu-mode-n)
" nmap N <Plug>(anzu-mode-N)
