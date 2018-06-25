
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
    autocmd FileType qf setlocal number
    autocmd FileType qf setlocal scroll=0
    autocmd FileType qf setlocal nohidden

    autocmd FileType qf nnoremap  <space> :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap  <space>c :PreviewClose<cr>

    autocmd FileType qf nnoremap  <C-n> :cnext<CR> :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap  <C-b> :cNext<CR> :PreviewQuickfix<cr>
augroup END


" function Mypreview()
"     augroup qfpreview
"         autocmd!
"         autocmd CursorMoved * if &filetype =='qf'| :PreviewQuickfix | endif
"     augroup END
" endfunc
" autocmd FileType qf nnoremap <buffer> <leader>vv :call Mypreview()<cr>
"
" function Close()
"     augroup qfpreview
"         autocmd!
"     augroup END
" endfunc
" autocmd FileType qf nnoremap <buffer> <leader>vc :call Close()<cr>
