
let g:airline_theme     = 'molokai'
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%F'

" enable tabline
set showtabline=2
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod  = ':t'

" Use the default set of separators with a few customizations
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline#extensions#tabline#left_sep = ""
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ""
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''

