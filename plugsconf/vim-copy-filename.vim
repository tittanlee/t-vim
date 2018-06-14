
" Copy current buffer path relative to root of VIM session to system clipboard
nmap <leader>cp :CopyAbsolutePath<CR>:echo "Copied file path to clipboard"<cr>

" Copy current filename to system clipboard
nmap <leader>cf :CopyFileName<CR>:echo "Copied file name to clipboard"<cr>

" Copy current buffer path without filename to system clipboard
nmap <leader>cd :CopyDirectoryPath<CR>:echo "Copied file directory to clipboard"<cr>

