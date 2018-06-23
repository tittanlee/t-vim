
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
    autocmd FileType qf setlocal number
    autocmd FileType qf setlocal scroll=0

    autocmd FileType qf nnoremap  <space> :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap  <space>c :PreviewClose<cr>
augroup END
