" inoremap <silent><expr> ( complete_parameter#pre_complete("(")
inoremap <silent><expr> <space> cmp#pre_complete(" ()")

" Select next overload function.
imap <M-d> <Plug>(complete_parameter#overload_down)
smap <M-d> <Plug>(complete_parameter#overload_down)

" Select previous overload function.
imap <M-u> <Plug>(complete_parameter#overload_up)
smap <M-u> <Plug>(complete_parameter#overload_up)

" Goto next parameter and select it.
smap <C-j> <Plug>(complete_parameter#goto_next_parameter)
imap <C-j> <Plug>(complete_parameter#goto_next_parameter)

" Goto previous parameter and select it.
smap <C-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <C-k> <Plug>(complete_parameter#goto_previous_parameter)
