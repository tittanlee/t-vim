
" By default, airline will use unicode symbols if your encoding matches
" utf-8. If you want the powerline symbols set this variable:
let g:airline_powerline_fonts = 1

if !exists('g:t_vim_airline_theme')
    let g:t_vim_airline_theme = 'violet'
endif
let g:airline_theme = g:t_vim_airline_theme
" let g:airline_section_b = '%{getcwd()}'
" let g:airline_section_c = '%F'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep           = '▶'
let g:airline_right_sep          = '◀'
let g:airline_symbols.crypt      = '🔒'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.branch     = '⎇'
let g:airline_symbols.paste      = '∥'
let g:airline_symbols.notexists  = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
if get(g:, 'airline_powerline_fonts', 0)
    let g:airline_left_sep          = "\uE0BC"
    let g:airline_left_alt_sep      = "\uE0BD"
    let g:airline_right_sep         = "\uE0BE"
    let g:airline_right_alt_sep     = "\uE0BF"
    let g:airline_symbols.branch    = ''
    let g:airline_symbols.readonly  = ''
    let g:airline_symbols.linenr    = ''
    let g:airline_symbols.maxlinenr = ''
endif

" enable tabline
set showtabline=2
let g:airline#extensions#tabline#enabled       = 1
let g:airline#extensions#tabline#show_tab_nr   = 1
let g:airline#extensions#tabline#tab_nr_type   = 2
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#formatter     = 'default'
let g:airline#extensions#tabline#fnamemod      = ':t'
let g:airline#extensions#tabline#left_sep      = "\uE0BC"
let g:airline#extensions#tabline#left_alt_sep  = "\uE0BD"
let g:airline#extensions#tabline#right_sep     = "\uE0BE"
let g:airline#extensions#tabline#right_alt_sep = "\uE0BF"
" let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#buffers_label = 'Buffers'
" let g:airline#extensions#tabline#tabs_label    = ''
let g:airline#extensions#tabline#tabs_label    = 'Tabs'

" configure the title text for quickfix buffers >
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'

" configure the title text for location list buffers >
let g:airline#extensions#quickfix#location_text = 'Location'

" enable/disable bufferline integration >
let g:airline#extensions#bufferline#enabled = 1

" enable/disable bufferline integration >
let g:airline#extensions#fugitiveline#enabled = 1

" enable/disable vim-gutentags integration >
let g:airline#extensions#gutentags#enabled = 1

" enable/disable vim-capslock integration >
let g:airline#extensions#capslock#enabled = 1

" enable/disable showing a summary of changed hunks under source control. >
let g:airline#extensions#hunks#enabled = 1

" enable/disable showing only non-zero hunks. >
let g:airline#extensions#hunks#non_zero_only = 0

" set hunk count symbols. >
let g:airline#extensions#hunks#hunk_symbols = ["\uF067", "\uE77F", "\uF068"]

" * enable/disable YCM integration >
let g:airline#extensions#ycm#enabled = 1

" * set error count prefix >
let g:airline#extensions#ycm#error_symbol = 'E:'

" * set warning count prefix >
let g:airline#extensions#ycm#warning_symbol = 'W:'

" * enable/disable tagbar integration >
let g:airline#extensions#tagbar#enabled = 0

" * change how tags are displayed (:help tagbar-statusline) >
" let g:airline#extensions#tagbar#flags = ''  (default)
" let g:airline#extensions#tagbar#flags = 'f'
" let g:airline#extensions#tagbar#flags = 's'
" let g:airline#extensions#tagbar#flags = 'p'



"----------------------------------------------------------------------
" Airline key mapping <leader><leader> + [u, p, t, b, m]
"----------------------------------------------------------------------
nnoremap <silent> <leader>ab :AirlineToggleWhitespace <CR>
