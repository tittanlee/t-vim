
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
    autocmd FileType qf setlocal number
    autocmd FileType qf setlocal scroll=0
    autocmd FileType qf setlocal nohidden
    autocmd FileType qf setlocal nolist

    autocmd FileType qf nnoremap  <space>  :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap  <space>c :PreviewClose<cr>

    autocmd FileType qf nnoremap  <C-n> <down> :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap  <C-N> <up>   :PreviewQuickfix<cr>
augroup END
