let g:lightline = {}

let g:lightline = {
            \ 'colorscheme' : g:t_vim_lightline_theme,
            \ 'enable'      : { 'statusline' : 1  , 'tabline' : 1  } ,
            \ 'separator'   : { 'left'       : '', 'right'   : ''} ,
            \ 'subseparator': { 'left'       : '', 'right'   : ''} ,
            \ 'active': {
            \       'left':  [['mode'],['CocStatus'],['FunctionName']],
            \       'right': [['LineInfo'],['FileFormat','FileEncoding','FileSyntax'],['GutenTagStatus'],['anzu']]
            \   },
            \ 'inactive': {
            \       'left':  [['mode']],
            \       'right': [['LineInfo']],
            \   },
            \ 'component_function': {
            \       'CocStatus'      : 'coc#status'            ,
            \       'FunctionName'   : 'GetFunctionName'       ,
            \       'GutenTagStatus' : 'GetTagStatus'          ,
            \       'anzu'           : 'anzu#search_status'    ,
            \       'LineInfo'       : 'GetLineInfo'           ,
            \       'FileFormat'     : 'GetFileFormat'         ,
            \       'FileEncoding'   : 'GetFileEncoding'       ,
            \       'FileSyntax'     : 'GetFileSyntax'       ,
            \   },
            \ 'component_expand' : {
            \       'GitInfo' : 'GetGitInfo'      ,
            \       'RootDir' : 'GetRootDir'      ,
            \       'Filename': 'GetFilenameIcon' ,
            \       'Readonly': 'GetReadonly'     ,
            \       'Modified': 'GetFileModified' ,
            \   },
            \ 'component_type': {
            \   'GitInfo' : 'right',
            \   'RootDir' : 'right',
            \   'Filename': 'tabsel',
            \   'Modified': 'tabsel',
            \   'Readonly': 'tabsel',
            \   },
            \ 'tabline': {
            \     'left': [['RootDir', 'Filename']],
            \     'right': [['GitInfo'], ['Modified','Readonly'] ],
            \   },
            \ 'tabline_separator':    { 'left': '', 'right': '' },
            \ 'tabline_subseparator': { 'left': '', 'right': '' },
            \ }

" GetRootDir {{{
function! GetRootDir() abort
    if s:IsSpecial()
        return ""
    endif

    return '🏠'. " " . getcwd()
endfunction
" }}}

" GitInfo {{{
function! GetGitInfo() abort
    if s:IsSpecial()
        return ""
    endif

    let gitBranch = get(g:, 'coc_git_status', "")
    let gitCount  = get(b:, 'coc_git_status', "")
    return trim(gitBranch . gitCount)
endfunction
" }}}

" Filename {{{
function! GetReadonly()
    if s:IsSpecial()
        return ""
    endif

    let isReadonly = &readonly ? "🔒" : "🔓"
    return isReadonly
endfunction
" }}}

" Get Function Name {{{
function! GetFunctionName() abort
    return tagbar#currenttag('%s -> ', '') . tagbar#currenttagtype("(%s) ", '')
endfunction
" }}}

" GetFilenameIcon {{{
function! GetFilenameIcon() abort
    if empty(expand('%:t'))
        return '[No Name]'
    endif

    let filename = fnamemodify(expand("%"), ":~:.")
    let icon = strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . " " : "no ft"
    return join([icon, filename], "")
endfunction
" }}}

" GetFileModified {{{
" modified -> file has been mod without save
" modifiable -> buffer could be mod or not
function! GetFileModified() abort
    return s:IsSpecial() ?  ""  :
    \      &modified     ?  "📌" :
    \      &modifiable   ?  "➕"  : "➖"
endfunction
" }}}

" GetTagStatus {{{
function! GetTagStatus() abort
    let l:modules_in_progress = gutentags#inprogress()
    if empty(l:modules_in_progress)
       return ''
    endif

    let l:msg = ''
    if index(l:modules_in_progress, 'ctags') >= 0
        let l:msg .= 'ctags '.'⏳'
    endif
    if index(l:modules_in_progress, 'gtags_cscope') >= 0
        let l:msg .= 'gtags '.'⏳'
    endif
    return l:msg
endfunction
" }}}


" IsSpecial {{{
function! s:IsSpecial() abort
    return &buftype == 'terminal' || &filetype =~ '\v(help|startify|defx|undotree|vista)'
endfunction
" }}}


" LineInfo {{{
function! GetLineInfo() abort
    return &filetype == 'help'     ? ' ' :
    \      &filetype == 'defx'     ? '🌴 ' :
    \      &filetype == 'startify' ? '🏠 ' :
    \      &filetype == 'undotree' ? '🌴 ' :
    \      &filetype == 'vista'    ? '🛠  ':
    \      &buftype  == 'terminal' ? '👿 ' :
    \      printf(' %d:%2d ☰ %3d%%', line('.'), col('.'), 100 * line('.') / line('$'))
endf
" }}}

" FileFormat {{{
function! GetFileFormat()
    if s:IsSpecial() || winwidth(0) <= 70
        return ""
    endif
    return &fileformat . " " . WebDevIconsGetFileFormatSymbol()
endf
" }}}

" FileEncoding {{{
function! GetFileEncoding()
    if s:IsSpecial() || winwidth(0) <= 70
        return ""
    endif
    return empty(&fenc) ? &enc.' 👽' : &fenc.' 👽'
endf
" }}}

" FileSyntax {{{
function! GetFileSyntax()
    if s:IsSpecial() || winwidth(0) <= 70
        return ""
    endif
    return empty(&syntax) ? '': &syntax
endf
" }}}

