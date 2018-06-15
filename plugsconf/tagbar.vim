
let g:tagbar_left            = 1
let g:tagbar_autofocus       = 0
let g:tagbar_foldlevel       = 2
let g:tagbar_type_typescript = {
            \ 'ctagstype': 'typescript',
            \ 'kinds': [
            \ 'c:classes',
            \ 'n:modules',
            \ 'f:functions',
            \ 'v:variables',
            \ 'v:varlambdas',
            \ 'm:members',
            \ 'i:interfaces',
            \ 'e:enums',
            \ ]
            \ }

nmap t :TagbarToggle<CR>

