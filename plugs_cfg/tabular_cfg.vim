
" Bind the key mpa if tabular exist {{{
    nnoremap <Leader>a& :Tabularize /&<CR>
    vnoremap <Leader>a& :Tabularize /&<CR>
    nnoremap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    vnoremap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    nnoremap <Leader>a=> :Tabularize /=><CR>
    vnoremap <Leader>a=> :Tabularize /=><CR>
    nnoremap <Leader>a: :Tabularize /:<CR>
    vnoremap <Leader>a: :Tabularize /:<CR>
    nnoremap <Leader>a:: :Tabularize /:\zs<CR>
    vnoremap <Leader>a:: :Tabularize /:\zs<CR>
    nnoremap <Leader>a, :Tabularize /,<CR>
    vnoremap <Leader>a, :Tabularize /,<CR>
    nnoremap <Leader>a,, :Tabularize /,\zs<CR>
    vnoremap <Leader>a,, :Tabularize /,\zs<CR>
    nnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>
    nnoremap <Leader>a<space> :Tabularize /\S\+;$/l1<CR>
    vnoremap <Leader>a<space> :Tabularize /\S\+;$/l1<CR>
" }}}
