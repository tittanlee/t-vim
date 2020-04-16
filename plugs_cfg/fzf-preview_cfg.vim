
" If this value is 1, display fzf window using Floating Window
let g:fzf_preview_use_floating_window = has('nvim') ? 1 : 0

if !g:fzf_preview_use_floating_window
    " This value is the layout displayed when executing the fzf command.
    let g:fzf_preview_layout = 'bo split new'
else
    " floating window size ratio
    let g:fzf_preview_floating_window_rate = 0.9

    " This value is used for the value of winblend in the floating window.
    let g:fzf_preview_floating_window_winblend = 10
endif

" If this value is 1, devicons is used as fzf candidate.
let g:fzf_preview_use_dev_icons = 0

" If this value is 1, mapping that will safely quit
" in fzf's normal mode and visual mode is added
let g:fzf_preview_quit_map = 1

" This is the command used to search for files in the project.
let g:fzf_preview_filelist_command = 'rg --files --hidden --no-ignore --glob "!.git/"'

" This is the command used to search for files in the current directory.
let g:fzf_preview_directory_files_command = 'rg --files --hidden --no-ignore --glob "!.git/"'

" Shell command used for fzf preview. The head command is used by default.
" If the bat command is installed, the bat is used by default and
" the preview is syntax highlighted.
let g:fzf_preview_command = 'bat --color=always --theme=TwoDark --style=numbers {-1}'

" g:fzf_binary_preview_command is executed if this command succeeds,
" Default value is '[[ "$(file --mime {})" =~ binary ]]'
if (has('win32') || has('win64'))
    let g:fzf_preview_if_binary_command = '""'
    let g:fzf_binary_preview_command = '""'
endif

" Keyboard shortcuts while fzf preview is active
let g:fzf_preview_preview_key_bindings = 'ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview'

" Commands used for project grep
let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading'

" Commands used for current file lines
let g:fzf_preview_lines_command = 'bat --color=always --theme=TwoDark --plain'

" Commands used for preview of the grep result
let g:fzf_preview_grep_preview_cmd = 'python3 ' .g:t_vim_bundle_home . '/fzf-preview/bin/preview_fzf_grep'


" Fzf Preview Key map {{{

    nmap <Leader>f [fzf-p]
    xmap <Leader>f [fzf-p]

    nnoremap <silent> [fzf-p]f      :<C-u>FzfPreviewDirectoryFiles<CR>

    nnoremap <silent> [fzf-p]b      :<C-u>FzfPreviewBuffers<CR>
    nnoremap <silent> [fzf-p]B      :<C-u>FzfPreviewAllBuffers<CR>

    nnoremap <silent> [fzf-p]j      :<C-u>FzfPreviewJumps<CR>

    nnoremap <silent> [fzf-p]g;     :<C-u>FzfPreviewChanges<CR>

    nnoremap <silent> [fzf-p]/      :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query=""<CR>
    nnoremap <silent> [fzf-p]*      :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>

    nnoremap [fzf-p]g<Space>        :<C-u>FzfPreviewProjectGrep<Space>
    nnoremap <silent> [fzf-p]gg     :<C-u>FzfPreviewProjectGrep -F "<C-r>=expand('<cword>')<CR>" <CR>

    nnoremap <silent> [fzf-p]t      :<C-u>FzfPreviewBufferTags<CR>

    nnoremap <silent> [fzf-p]q      :<C-u>FzfPreviewQuickFix<CR>

    nnoremap <silent> [fzf-p]l      :<C-u>FzfPreviewLocationList<CR>

" }}}
