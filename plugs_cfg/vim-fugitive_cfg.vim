


" vim-fugitive key map {{{
    nmap <Leader>g [vim-fugitive]

    nnoremap <silent> [vim-fugitive]s :Gstatus<CR>
    nnoremap <silent> [vim-fugitive]d :Gdiff<CR>
    nnoremap <silent> [vim-fugitive]c :Gcommit<CR>
    nnoremap <silent> [vim-fugitive]b :Gblame<CR>
    nnoremap <silent> [vim-fugitive]l :Glog<CR>
    nnoremap <silent> [vim-fugitive]p :Git push<CR>
    nnoremap <silent> [vim-fugitive]r :Gread<CR>
    nnoremap <silent> [vim-fugitive]w :Gwrite<CR>
    nnoremap <silent> [vim-fugitive]e :Gedit<CR>
    " Mnemonic _i_nteractive
    nnoremap <silent> [vim-fugitive]i :Git add -p %<CR>
" }}}
