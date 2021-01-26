" Verbose informations will be printed if you turn this option on.
let g:ctrlsf_debug_mode = 0

" defines the path of ack/ag which CtrlSF will use as its
" backend. If nothing is given, CtrlSF will try to figure out a proper backend.
" Preferred order is 'ag' > 'ack' > 'rg' > 'pt' > 'ack-grep'.
let g:ctrlsf_ackprg = 'rg'

" Default: 'async' for version 8.0+, 'sync' for others
let g:ctrlsf_search_mode = 'async'

" By default CtrlSF window will be opened at left. You can also specify for it to
" be opened 'top', 'right', or 'bottom'
let g:ctrlsf_position = 'right'

" Size of CtrlSF window.
let g:ctrlsf_winsize = '50%'

" Highlight matching line in the target file. It is useful especially in preview mode.
" 'o' : highlight matching line in the target file after file is opened.
" 'p' : highlight matching line in preview window.
let g:ctrlsf_selected_line_hl = 'p'

" Defines the default case-sensitivity in search.
let g:ctrlsf_case_sensitive = 'smart'

" Defines whether the backend should follow symbolic links or not.
let g:ctrlsf_follow_symlinks = 0

" defines how CtrlSF handles itself in 'normal' and 'compact'
" view mode(|g:ctrlsf_default_view_mode|) respectively after you have opened a file
" from CtrlSF window. By default, CtrlSF will close itself in 'normal' view mode and
" keep open in 'compact' view mode.
let g:ctrlsf_auto_close = {
            \ "normal" : 0,
            \ "compact": 0
            \ }

" 'g:ctrlsf_auto_focus' defines which timing CtrlSF should focus result pane when
" working in async search mode.
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

" 'g:CtrlSFAfterMainWindowInit' defines a function will be called after CtrlSF
" window initialized. It can be used to override default window setting.
" function! g:CtrlSFAfterMainWindowInit()
"     autocmd!
"     autocmd FileType ctrlsf setlocal wrap
"     autocmd FileType ctrlsf setlocal number
"     autocmd FileType ctrlsf setlocal scrolloff=0
"     autocmd FileType ctrlsf setlocal nohidden
"     autocmd FileType ctrlsf setlocal nolist
"     autocmd * CtrlSFFocus
" endfunction


" Fzf Preview Key map {{{
    nmap <Leader>r [ctrlsf_key]
    vmap <Leader>r [ctrlsf_key]

    nmap     [ctrlsf_key]f <Plug>CtrlSFPrompt
    vmap     [ctrlsf_key]f <Plug>CtrlSFVwordPath
    vmap     [ctrlsf_key]F <Plug>CtrlSFVwordExec

    nmap     [ctrlsf_key]w <Plug>CtrlSFCwordPath
    nmap     [ctrlsf_key]W <Plug>CtrlSFCwordExec
    vmap     [ctrlsf_key]W <Plug>CtrlSFVwordExec

    nnoremap [ctrlsf_key]o :CtrlSFToggle<CR>
    inoremap [ctrlsf_key]o <Esc>:CtrlSFToggle<CR>
" }}}
