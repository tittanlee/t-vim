
" Bind the key mpa if vim-quickhl exist {{{
    nmap <LocalLeader>h [vim-quickhl]

    nnoremap [vim-quickhl]k :QuickhlManualAdd <C-r>=expand('<cword>')<CR><CR>
    nnoremap [vim-quickhl]kd :QuickhlManualDelete <C-r>=expand('<cword>')<CR><CR>
    nnoremap [vim-quickhl]K :QuickhlManualReset <CR>
" }}}

