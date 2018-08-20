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

let g:ctrlsf_extra_backend_args = {
    \ 'pt': '--home-ptignore',
    \ 'rg': '--colors "match:fg:magenta" --colors "line:bg:yellow"',
    \ }

" Defines the default case-sensitivity in search.
let g:ctrlsf_case_sensitive = 'smart'


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


nmap     <C-f>f <Plug>CtrlSFPrompt
vmap     <C-f>f <Plug>CtrlSFVwordPath
vmap     <C-f>F <Plug>CtrlSFVwordExec
nmap     <C-f>n <Plug>CtrlSFCwordPath
nmap     <C-f>p <Plug>CtrlSFPwordPath
nnoremap <C-f>o :CtrlSFToggle<CR>
inoremap <C-f>o <Esc>:CtrlSFToggle<CR>

let g:ctrlsf_mapping = {
            \ "open"    : ["<CR>", "o"],
            \ "openb"   : "O",
            \ "split"   : "<C-O>",
            \ "vsplit"  : "",
            \ "tab"     : "t",
            \ "tabb"    : "T",
            \ "popen"   : "p",
            \ "popenf"  : "P",
            \ "quit"    : "q",
            \ "next"    : "<C-J>",
            \ "prev"    : "<C-K>",
            \ "pquit"   : "q",
            \ "loclist" : "",
            \ "chgmode" : "M",
            \ "stop"    : "<M-c>",
            \ }


"=======================================
" CtrlSF backend args plus
"=======================================
let g:rg_args_map = {
            \ 'c'      : '*.c',
            \ 'h'      : '*.h',
            \ 'dsc'    : '*.dsc',
            \ 'dec'    : '*.dec',
            \ 'fdf'    : '*.fdf',
            \ 'uni'    : '*.uni',
            \ 'vfr'    : '*.vfr',
            \ 'inf'    : '*.inf',
            \ 'uefi'   : '*.c,*.h,*.dec,*.dsc,*.fdf,*.inf,*.uni,*.vfr',
            \ 'sdl'    : '*.sdl',
            \ 'sd'     : '*.sd',
            \ 'txt'    : '*.txt',
            \ 'mak'    : '*.mak',
            \ 'equ'    : '*.equ',
            \ 'cbin'   : '*.cbin',
            \ 'ami'    : '*.sdl,*.sd,*.txt,*.mak,*.equ,*.cbin',
            \ 'asm'    : '*.asm,*.s,*.S',
            \ 'xml'    : '*.xml',
            \ 'py'     : '*.py',
            \ 'cfg'    : '*.cfg',
            \ 'ld'     : '*.ld',
            \ 'qcom'   : '*.xml,*.py,*.cfg,*.inc,*.ld',
            \ 'report' : '*.report',
            \ 'inc'    : '*.inc'
            \ }

let g:rg_cmd_list = {
    \ 'def' : ['--colors "match:fg:magenta" --colors "line:bg:yellow"'],
    \ 'inc' : ['--colors "match:fg:magenta" --colors "line:bg:yellow" --type-add "fexts:{', '}" -tfexts'],
    \ 'exc' : ['--colors "match:fg:magenta" --colors "line:bg:yellow" --type-add "fexts:{', '}" --type-not fexts']
\ }

function! s:CtrlSFBackEndArgsOptions(...)
    let filter       = ''
    let filter_flag  = 0
    let exclude_flag = 0

    for args in a:000
        if args == '!'
            let exclude_flag = 1
        else
            let filter_flag = 1
            let args_list = split(args, ',')
            for key in args_list
                if has_key(g:rg_args_map, key)
                    let filter = !strlen(filter) ? filter.g:rg_args_map[key] : filter.','.g:rg_args_map[key]
                endif
            endfor
        endif
    endfor

    if filter_flag && exclude_flag
        if has_key(g:rg_cmd_list, 'exc')
            let cmd_format = g:rg_cmd_list['exc']
        endif
    elseif filter_flag && !exclude_flag
        if has_key(g:rg_cmd_list, 'inc')
            let cmd_format = g:rg_cmd_list['inc']
        endif
    else
        if has_key(g:rg_cmd_list, 'def')
            let cmd_format = g:rg_cmd_list['def']
        endif
    endif

    let cmd_package = join(cmd_format, filter)

    " override rg command to ctrlsf
    if has_key(g:ctrlsf_extra_backend_args, 'rg')
        let g:ctrlsf_extra_backend_args['rg'] = cmd_package
    endif
    echo g:ctrlsf_extra_backend_args['rg']
endfunc
command! -nargs=* CtrlSFOptions call s:CtrlSFBackEndArgsOptions(<f-args>)
