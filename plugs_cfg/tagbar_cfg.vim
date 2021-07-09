" If you set this option the cursor will move to the Tagbar window when it is
let g:tagbar_autofocus = 1

"Since the display of the icons used to indicate open or closed folds depends
"on the actual font used, different characters may be optimal for different
"fonts. With this variable you can set the icons to characters of your liking.
"The first character in the list specifies the icon to use for a closed fold,
"and the second one for an open fold.
let g:tagbar_iconchars = ['╰─▶', '├─▼']
"let g:tagbar_iconchars = ['▶', '▼']

" An entry in this list is a colon-separated string with the following syntax:
" {short}:{long}[:{fold}[:{stl}]]
let g:tagbar_type_c = {
            \ 'kinds' : [
            \ 'f:functions',
            \ 'h:header files:1:1',
            \ 'd:macros',
            \ 'p:prototypes:1:1',
            \ 'g:enums',
            \ 'e:enumerators:1:1',
            \ 't:typedefs:1:1',
            \ 's:structs',
            \ 'u:unions',
            \ 'm:members:1:1',
            \ 'v:variables',
            \ '?:unknown',
            \ ],
            \ }


let g:tagbar_type_asl = {
            \ 'kinds' : [
            \ 'c:scope',
            \ 'n:name:1:1',
            \ 'd:device',
            \ 'f:method',
            \ ],
            \ }

" Tagbar key mapping {{{
    nnoremap <Leader>t :TagbarToggle<CR>
" }}}

