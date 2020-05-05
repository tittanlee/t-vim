
noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>

autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

autocmd FileType qf nnoremap <silent><buffer><C-j> <DOWN>:silent PreviewQuickfix<CR>
autocmd FileType qf nnoremap <silent><buffer><C-k> <UP>:silent PreviewQuickfix<CR>
autocmd FileType qf nnoremap <silent><buffer><Enter> :silent PreviewClose<CR><ENTER>

