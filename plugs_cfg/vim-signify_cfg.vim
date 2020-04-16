
" Add the number of deleted lines to |g:signify_sign_delete| (up to 99).
" Otherwise, only the usual sign text will be shown.
let g:signify_sign_show_count = 0

" Enable line highlighting in addition to using signs by default.
let g:signify_sign_add               = '➕'
let g:signify_sign_delete            = '➖'
let g:signify_sign_delete_first_line = '⚠️'
let g:signify_sign_change            = '❗️'
let g:signify_sign_changedelete      = '⚡️'


" vim-signify key mapping {{{
    nmap <Leader>n [vim-signify]

    nnoremap <silent> [vim-signify]g :SignifyToggle<CR>
" }}}
