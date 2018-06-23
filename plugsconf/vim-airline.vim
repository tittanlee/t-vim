

" By default, airline will use unicode symbols if your encoding matches
" utf-8. If you want the powerline symbols set this variable:
let g:airline_powerline_fonts = 1

let g:airline_theme     = 'deus'
" let g:airline_section_b = '%{getcwd()}'
" let g:airline_section_c = '%F'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
if get(g:, 'airline_powerline_fonts', 0)
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.maxlinenr= ''
endif

" enable tabline
set showtabline=2
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type= 2
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod  = ':t'
let g:airline#extensions#tabline#left_sep = ""
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ""
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''

