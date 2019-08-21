
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
    autocmd FileType qf setlocal number
    autocmd FileType qf setlocal scrolloff=0
    autocmd FileType qf setlocal nohidden
    autocmd FileType qf setlocal nolist
    " Split quickfix on vertical left
    " autocmd FileType qf wincmd L

    autocmd FileType qf nnoremap <buffer> <space>  :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <buffer> <space>c :PreviewClose<cr> :cclose<cr>

    autocmd FileType qf nnoremap <buffer> <C-n> <down> :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <buffer> <C-b> <up>   :PreviewQuickfix<cr>
augroup END

noremap <A-]> :PreviewTag<CR>
noremap <A-c> :PreviewClose<CR>
noremap <A-u> :PreviewScroll -1<CR>
noremap <A-d> :PreviewScroll +1<CR>
noremap <A-g> :PreviewGoto vsplit<CR> \| :pclose<CR>
