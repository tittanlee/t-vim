let g:sidebars = {
            \ 'quickfix': {
            \     'position': 'bottom',
            \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'qf'},
            \     'open': 'copen',
            \     'close': 'cclose'
            \ },
            \ 'quickfix_L': {
            \     'position': 'right',
            \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'qf'},
            \     'open': 'copen | wincmd L',
            \     'close': 'cclose'
            \ },
            \'tagbar': {
            \     'position': 'right',
            \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'tagbar'},
            \     'open': 'TagbarToggle',
            \     'close': 'TagbarToggle'
            \ },
            \ }

noremap <silent> <Leader>tq  :call sidebar#toggle('quickfix')<CR>
noremap <silent> <Leader>tlq :call sidebar#toggle('quickfix_L')<CR>
noremap <silent> <Leader>to  :call sidebar#toggle('tagbar')<CR>
