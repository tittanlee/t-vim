let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore -g !.git/'
let $FZF_DEFAULT_OPTS    = '
            \ --pointer="->"
            \ --marker="#"
            \ --layout=reverse
            \ --border=sharp
            \ --bind="ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview,ctrl-f:page-up,ctrl-n:page-down"
            \'

" Whether to preview content.
let g:fzf_preview_window = ''

" Determines the size and position of fzf window
"let s:fzf_use_floating_win = has('nvim') ? 1 : 0
let s:fzf_use_floating_win = 0
if s:fzf_use_floating_win
    " Use fzf.vim popup window
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.80, 'border': 'sharp'} }
else
    let g:fzf_layout = { 'down': '~60%' }
endif

" FZF ripgrep search function with bat preview {{{
    function! RipgrepFzf(query, fullscreen)
        let command_fmt = 'rg --line-number --no-heading --color=always --smart-case %s | sed -e "s/:/ /g"'
        let initial_command = printf(command_fmt, shellescape(a:query))
        let reload_command = printf(command_fmt, '{q}')
        let spec = {'options': [
                    \ '--phony',
                    \ '--query', a:query,
                    \ '--bind', 'change:reload:'.reload_command,
                    \ '--preview-window', 'up:70%',
                    \ '--preview', 'bat --number --color always --theme TwoDark --line-range {2}: --highlight-line {2} {1}',
                    \ ] }
        call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
    endfunction

    command! -nargs=* -bang FzfRg call RipgrepFzf(<q-args>, <bang>0)
" }}}


" Fzf Key map {{{
    nmap <Leader>f [fzf-leaderkey]

    nnoremap <silent> [fzf-leaderkey]f   :<C-u>Files<CR>
    nnoremap <silent> [fzf-leaderkey]F   :<C-u>Filetypes<CR>
    nnoremap <silent> [fzf-leaderkey]b   :<C-u>Buffers<CR>
    nnoremap <silent> [fzf-leaderkey]r   :<C-u>Colors<CR>

    nnoremap <silent> [fzf-leaderkey]/   :<C-u>BLines<CR>
    nnoremap <silent> [fzf-leaderkey]l   :<C-u>Lines<CR>

    nnoremap <silent> [fzf-leaderkey]t   :<C-u>BTags<CR>
    nnoremap <silent> [fzf-leaderkey]T   :<C-u>Tags<CR>

    nnoremap <silent> [fzf-leaderkey]M   :<C-u>Marks<CR>
    nnoremap <silent> [fzf-leaderkey]m   :<C-u>Maps<CR>

    nnoremap <silent> [fzf-leaderkey]h   :<C-u>Helptags<CR>
    nnoremap <silent> [fzf-leaderkey]n   :<C-u>Snippets<CR>
    nnoremap <silent> [fzf-leaderkey]w   :<C-u>Windows<CR>

    nnoremap <silent> [fzf-leaderkey]gc  :<C-u>Commits<CR>
    nnoremap <silent> [fzf-leaderkey]bgc :<C-u>Commits<CR>

    nnoremap [fzf-leaderkey]gw  :<C-u>FzfRg <C-R>=expand("<cword>")<CR>
    nnoremap [fzf-leaderkey]gW  :<C-u>FzfRg <C-R>=expand("<cword>")<CR><CR>
" }}}


