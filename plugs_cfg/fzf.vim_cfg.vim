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
    let g:fzf_layout = { 'window': { 'width': 0.90, 'height': 0.9, 'border': 'sharp'} }
else
    let g:fzf_layout = { 'down': '~50%' }
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

    nnoremap <silent> [fzf-leaderkey]vim :<C-u>Files <C-R>=expand(g:t_vim_root)<CR><CR>

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

if 1
" FZF gtags search function with bat preview {{{
    function! s:trimGtags(index, item)
        let file_name = split(a:item, ' ')[0]
        let line_no= split(a:item, ' ')[2]
        return printf('%d %s %d %d', a:index, file_name, line_no, (line_no > 8 ? line_no - 8 : line_no))
    endfunction

    function! Fzfgtags(query, param)
        let command_fmt = 'global %s %s --result cscope'
        let initial_command = system(printf(command_fmt, shellescape(a:param), shellescape(a:query)))

        if empty(initial_command)
            return
        endif
        let lines = split(initial_command, "\n")
        let fzf_gtags_result = map(lines, function('s:trimGtags'))

        let s:preview_source_cmd = [
                    \ '--with-nth=1,2,3',
                    \ '--preview-window="up:50%%"',
                    \ '--preview="',
                    \ 'bat',
                    \ '--number',
                    \ '--color always',
                    \ '--theme Dracula',
                    \ '--line-range {4}:',
                    \ '--highlight-line {3} {2}"'
                    \ ]
        call add(s:preview_source_cmd, printf('--prompt="==> %s <== #>"', a:query))

        function! s:gtagsSelection(content)
            let filename = split(a:content, " ")[1]
            let lineno= split(a:content, " ")[2]
            let editfilecmd = printf('edit +%s %s', lineno, filename)
            execute editfilecmd . '| normal zz'
        endfunction

        call fzf#run ({
                    \   'source': fzf_gtags_result,
                    \   'sink': function('s:gtagsSelection'),
                    \   'options': join(s:preview_source_cmd, ' '),
                    \   'window': { 'width': 0.90, 'height': 0.90, 'border': 'sharp'}
                    \  })
    endfunction

    command! -nargs=+ -bang FzfGtags call Fzfgtags(<f-args>)

    nnoremap <C-\>d :FzfGtags <C-R>=expand('<cword>')<CR> -d<CR>
    nnoremap <C-\>g :FzfGtags <C-R>=expand('<cword>')<CR> -g<CR>
    nnoremap <C-\>r :FzfGtags <C-R>=expand('<cword>')<CR> -r<CR>
    nnoremap <C-\>s :FzfGtags <C-R>=expand('<cword>')<CR> -s<CR>
" }}}
endif
