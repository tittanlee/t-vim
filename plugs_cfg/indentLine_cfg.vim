
" By default, indentLine will overwrite 'conceal' color.
" If you want to highlight conceal with your
" colorscheme, set this value to 0.
let g:indentLine_setColors = 1

"This variable specify a list of file types.
"When opening these types of files, the plugin is enabled by
let g:indentLine_fileType = ['c', 'cpp', 'vim', 'python']

"This variable specify a list of file types.
"When opening these types of files, the plugin is disabled by
let g:indentLine_fileTypeExclude = ['defx']

"This variable specify a list of buffer types.
"When opening these types of buffers, the plugin is disabled
let g:indentLine_bufTypeExclude = ['help', 'terminal']


"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1

" Bind the key mpa if indentLine exist {{{
    " toggle the indent lines of the current buffer.
    nnoremap <leader>ig :IndentLinesToggle <CR>

    " toggle the leading spaces of the current buffer.
    nnoremap <leader>il :LeadingSpaceToggl <CR>
" }}}


