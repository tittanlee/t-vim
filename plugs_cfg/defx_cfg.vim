" Bind the key map if defx.nvim exist {{{
let g:defx_custom_option = {
            \ 'columns'            : 'indent:mark:git:icons:filename',
            \ 'winwidth'           : 35,
            \ 'split'              : 'vertical',
            \ 'direction'          : 'topleft',
            \ 'show_ignored_files' : 0,
            \ 'root_marker'        : '≡',
            \ 'buffer_name'        : 'defxplorer',
            \ 'ignored_files'      : '.git,.hg,.svn',
            \ }

nnoremap <silent> <Leader>w
            \ :<C-u>Defx -resume -toggle
            \ -columns=`expand(g:defx_custom_option['columns'])`
            \ -winwidth=`expand(g:defx_custom_option['winwidth'])`
            \ -split=`expand(g:defx_custom_option['split'])`
            \ -direction=`expand(g:defx_custom_option['direction'])`
            \ -show_ignored_files=`expand(g:defx_custom_option['show_ignored_files'])`
            \ -root_marker=`expand(g:defx_custom_option['root_marker'])`
            \ -buffer_name=`expand(g:defx_custom_option['buffer_name'])`
            \ -ignored_files=`expand(g:defx_custom_option['ignored_files'])`
            \ <CR>

nnoremap <silent> <Leader>e
            \ :<C-u>Defx -resume -search=`expand('%:p')`
            \ -columns=`expand(g:defx_custom_option['columns'])`
            \ -winwidth=`expand(g:defx_custom_option['winwidth'])`
            \ -split=`expand(g:defx_custom_option['split'])`
            \ -direction=`expand(g:defx_custom_option['direction'])`
            \ -show_ignored_files=`expand(g:defx_custom_option['show_ignored_files'])`
            \ -root_marker=`expand(g:defx_custom_option['root_marker'])`
            \ -buffer_name=`expand(g:defx_custom_option['buffer_name'])`
            \ -ignored_files=`expand(g:defx_custom_option['ignored_files'])`
            \ <CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort

    call defx#custom#option('_', g:defx_custom_option)

    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#is_directory() ?
                \ defx#do_action('open_directory') :
                \ defx#do_action('multi', ['drop', 'quit'])

    nnoremap <silent><buffer><expr> c     defx#do_action('copy')
    nnoremap <silent><buffer><expr> m     defx#do_action('move')
    nnoremap <silent><buffer><expr> p     defx#do_action('paste')
    nnoremap <silent><buffer><expr> l     defx#do_action('open')
    nnoremap <silent><buffer><expr> E     defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P     defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> o
                \ defx#is_directory() ?
                \ defx#do_action('open_or_close_tree') :
                \ defx#do_action('multi', ['drop'])

    nnoremap <silent><buffer><expr> K         defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N         defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M         defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C         defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S         defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d         defx#do_action('remove')
    nnoremap <silent><buffer><expr> r         defx#do_action('rename')
    nnoremap <silent><buffer><expr> !         defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x         defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy        defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .         defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;         defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h         defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~         defx#do_action('cd')
    nnoremap <silent><buffer><expr> q         defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>   defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *         defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j         line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k         line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>     defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>     defx#do_action('print')
    nnoremap <silent><buffer><expr> cd        defx#do_action('change_vim_cwd')
endfunction
" }}}
