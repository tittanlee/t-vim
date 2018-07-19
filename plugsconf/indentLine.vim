
" This variable specify a list of file types.
" When opening these types of files, the plugin is disabled by
" default.
let g:indentLine_fileTypeExclude = ['startify']


" Specify a character to be used as indent line.
" You also can use other characters:
" | ¦ ┆ │
" Default value is "|".
let g:indentLine_char = '¦'

let g:indentLine_leadingSpaceChar = '•'

" Specify GUI vim indent line color.
let g:indentLine_color_gui = '#F2C329'

" This variable specify a number, when the number of buffer's
" lines exceed it, the plugin try to use another pattern to make
" the performance better.
let g:indentLine_maxLines = 10000

" If you want the performance better, you can set the value as
" 1, default value is 0. But better performance may bring little
" issue with it.
let g:indentLine_faster = 1

" toggle the indent lines of the current buffer.
nnoremap <leader>ig :IndentLinesToggle <CR>

" toggle the leading spaces of the current buffer.
nnoremap <leader>il :LeadingSpaceToggl <CR>
