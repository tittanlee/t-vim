
" t_vim global vairalbe list {{{
    " let g:t_vim_bundle_home = '~/.vim/bundles'
    " let g:t_vim_colorscheme = 'gruvbox9'
    " let g:t_vim_lightline_theme = 'one'
    " let g:t_vim_cache = ''

    " let g:t_vim_bundle_group = [
    " 'color_scheme',
    " 'modern_ux',
    " 'file_explorer',
    " 'text_object',
    " 'programming',
    " 'filetypes',
    " 'source_control',
    " 'fuzzy_serach',
    " 'coc',
    " 'snippets',
    " 'uefi',
    " ]

    " t_vim Key map {{{
        " <Leader>a -> tabular
        " <leader>b -> bufexplorer
        " <Leader>c -> nerdcommenter
        " <Leader>g -> vim-fugitive
        " <Leader>f -> fzf
        " <leader>h -> vim-interestingwords
        " <LocalLeader>h -> vim-quickhl
        " <Leader>i -> indentLine
        " <Leader>n -> vim-signify
        " <Leader>r -> ctrlsf
        " <Leader>s -> vim-easymotion
        " <Leader>o -> coc.nvim
    " }}}
" }}}


" t_vim environmet variables initialized {{{
    " Get the absolute path of t_vim_root 
    let g:t_vim_root = fnamemodify(expand('<sfile>'), ':h')

    " vim theme setting
    if !exists('g:t_vim_colorscheme')
        let g:t_vim_colorscheme = 'dracula'
    endif

    " lightline theme setting
    if !exists('g:t_vim_lightline_theme')
        let g:t_vim_lightline_theme = 'dracula'
    endif
" }}}


" Define a command to source file {{{
    command! -nargs=1 LoadScript exec 'source '.g:t_vim_root.'/'.'<args>'
" }}}

" Core module loaded {{{
    " (n)vim basic options setting
    LoadScript core/basic.vim

    " (n)vim key mapping
    LoadScript core/keymap.vim

    " (n)vim plugin manager
    LoadScript core/plugins.vim

    " (n)vim plugin configuration
    LoadScript core/plugins_cfg.vim

    " (n)vim theme configuration
    LoadScript core/theme.vim
" }}}
