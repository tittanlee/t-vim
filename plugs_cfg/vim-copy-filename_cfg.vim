
" Bind the key mpa if vim-copy-filename exist {{{
    if index(g:plugs_order, 'vim-copy-filename') >= 0
        " Copy current buffer path relative to root of VIM session to system clipboard
        nmap <leader>cp :CopyAbsolutePath<CR>:echo "Copied file path to clipboard"<CR>

        " Copy current filename to system clipboard
        nmap <leader>cf :CopyFileName<CR>:echo "Copied file name to clipboard"<CR>

        " Copy current buffer path without filename to system clipboard
        nmap <leader>cd :CopyDirectoryPath<CR>:echo "Copied file directory to clipboard"<CR>
    endif
" }}}
