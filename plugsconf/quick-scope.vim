
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F']


" This option is provided to reduce the slowdown caused by vanilla highlight mode in large terminals.
" let g:qs_lazy_highlight = 1

highlight QuickScopePrimary   guifg = #afff5f guibg=#990000 gui=underline,bold ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg = #5fffff guibg=#990000 gui=underline,bold ctermfg=81  cterm=underline

" let g:qs_accepted_chars+=['(', ')', '[', ']', '{', '}']
