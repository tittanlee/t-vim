" set the height of quickfix windws
let g:gutentags_plus_height = 10

" You can disable the default keymaps by:
let g:gutentags_plus_nomap = 1

" '{querytype}' corresponds to the actual cscope line interface numbers as well
" as default nvi commands:
" 0 or s: Find this symbol
" 1 or g: Find this definition
" 2 or d: Find functions called by this function
" 3 or c: Find functions calling this function
" 4 or t: Find this text string
" 6 or e: Find this egrep pattern
" 7 or f: Find this file
" 8 or i: Find files #including this file
" 9 or a: Find places where this symbol is assigned a value
noremap <silent> <C-\>s :GscopeFind s <C-R><C-W><cr>
noremap <silent> <C-\>g :GscopeFind g <C-R><C-W><cr>
noremap <silent> <C-\>c :GscopeFind c <C-R><C-W><cr>
noremap <silent> <C-\>t :GscopeFind t <C-R><C-W><cr>
noremap <silent> <C-\>e :GscopeFind e <C-R><C-W><cr>
noremap <silent> <C-\>f :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <C-\>i :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <C-\>d :GscopeFind d <C-R><C-W><cr>
noremap <silent> <C-\>a :GscopeFind a <C-R><C-W><cr>
