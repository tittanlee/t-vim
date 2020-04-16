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
let s:fzf_use_floating_win = 1
if s:fzf_use_floating_win
    " Use fzf.vim popup window
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.80, 'border': 'sharp'} }
else
    let g:fzf_layout = { 'down': '~40%' }
endif


" FZF ripgrep search function with bat preview {{{
    function! FzfRipgrep(query)
        let fzf_source = 'rg --line-number --no-heading --glob "!.git/*" --smart-case %s | awk -F: "{line = ($2 > 20)? $2-20 : 1; print $1, $2, line}"'
        let fzf_source_command = printf(fzf_source, shellescape(a:query))

        let fzf_options = $FZF_DEFAULT_OPTS . ' --with-nth 1 --preview="bat --number --color always --theme Dracula --line-range {3}: --highlight-line {2} {1}"'

        function! s:edit_file(item)
            let l:file_path = split (a:item, " ")[0]
            let l:num       = split (a:item, " ")[1]
            execute 'silent e +'. l:num . " " . l:file_path . " | normal zz"
        endfunction

        call fzf#run({
                    \ 'source' : fzf_source_command,
                    \ 'sink'   : function('s:edit_file'),
                    \ 'options': fzf_options,
                    \ 'window' : { 'width': 0.9, 'height': 0.9, 'border': 'sharp' }
                    \})
    endfunction

    command! -nargs=* -bang FzfRg call FzfRipgrep(<q-args>)
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


