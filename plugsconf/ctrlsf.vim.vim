
let g:ctrlsf_search_mode = 'async'

let g:ctrlsf_winsize = '40%'

let g:ctrlsf_position = 'left'

let g:ctrlsf_extra_backend_args = {
    \ 'pt': '--home-ptignore',
    \ 'rg': '--vimgrep',
    \ }

nmap <space>sf :CtrlSF
