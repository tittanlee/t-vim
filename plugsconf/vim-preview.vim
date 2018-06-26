
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
    autocmd FileType qf setlocal number
    autocmd FileType qf setlocal scrolloff=0
    autocmd FileType qf setlocal nohidden
    autocmd FileType qf setlocal nolist

    autocmd FileType qf nnoremap  <space>  :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap  <space>c :PreviewClose<cr> :cclose<cr>

    autocmd FileType qf nnoremap  <C-n> <down> :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap  <C-b> <up>   :PreviewQuickfix<cr>
augroup END
