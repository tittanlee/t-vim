inoremap <silent><expr> ( complete_parameter#pre_complete("()")

" Select next overload function.
nmap <M-d> <Plug>(complete_parameter#overload_down)
imap <M-d> <Plug>(complete_parameter#overload_down)
smap <M-d> <Plug>(complete_parameter#overload_down)

" Select previous overload function.
nmap <M-u> <Plug>(complete_parameter#overload_up)
imap <M-u> <Plug>(complete_parameter#overload_up)
smap <M-u> <Plug>(complete_parameter#overload_up)

" Goto next parameter and select it.
nmap <C-j> <Plug>(complete_parameter#goto_next_parameter)
smap <C-j> <Plug>(complete_parameter#goto_next_parameter)
imap <C-j> <Plug>(complete_parameter#goto_next_parameter)

" Goto previous parameter and select it.
nmap <C-k> <Plug>(complete_parameter#goto_previous_parameter)
smap <C-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <C-k> <Plug>(complete_parameter#goto_previous_parameter)
