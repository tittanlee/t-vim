

" set this setting to 1 then the natural sort order will be used.
let NERDTreeNaturalSort = 1

" This setting tells vim whether to display hidden files by default.
let NERDTreeShowHidden = 1

"This setting tells vim whether to display line numbers for the NERDTree window.
let NERDTreeShowLineNumbers = 1

" Change the default arrows?
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

nnoremap <silent> <Leader>w :NERDTreeToggle<CR>

nnoremap <silent> <Leader>e :NERDTreeFind<CR>
