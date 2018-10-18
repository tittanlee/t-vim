" fzf drop down
let g:fzf_layout         = { 'down': '~40%' }
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore'
let $FZF_DEFAULT_OPTS    = '--layout=reverse-list --border'
"let g:fzf_tags_command   = 'ctags --extra=+f -R'

" Customize fzf colors to match your color scheme
" let g:fzf_colors =
"             \ { 'fg':      ['fg', 'Normal'],
"             \ 'bg':      ['bg', 'Normal'],
"             \ 'hl':      ['fg', 'Comment'],
"             \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"             \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"             \ 'hl+':     ['fg', 'Statement'],
"             \ 'info':    ['fg', 'PreProc'],
"             \ 'border':  ['fg', 'Ignore'],
"             \ 'prompt':  ['fg', 'Conditional'],
"             \ 'pointer': ['fg', 'Exception'],
"             \ 'marker':  ['fg', 'Keyword'],
"             \ 'spinner': ['fg', 'Label'],
"             \ 'header':  ['fg', 'Comment'] }

let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Type'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Identifier'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }


" fzf mappings
nnoremap <leader>.f  :Files<CR>
nnoremap <Leader>.l  :Lines<CR>
nnoremap <Leader>.t  :Tags<CR>
nnoremap <Leader>.b  :Buffers<CR>
nnoremap <Leader>.c  :Commands<CR>
nnoremap <Leader>.w  :Windows<CR>
nnoremap <Leader>.a  :Ag<CR>
nnoremap <Leader>.g  :GitFiles<CR>
nnoremap <Leader>.o  :Locate<Space>
nnoremap <Leader>.m  :Maps<CR>
nnoremap <Leader>.h  :History<CR>
nnoremap <Leader>.s  :Snippets<CR>
nnoremap <Leader>.i  :Commits<CR>
nnoremap <Leader>.r  :Colors<CR>
nnoremap <Leader>.e  :Helptags<CR>
nnoremap <Leader>..c :BCommits<CR>
nnoremap <Leader>..t :BTags<CR>
nnoremap <Leader>..l :BLines<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

nnoremap <leader>j :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* FZFRg
            \ call fzf#vim#grep(
            \ 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)


" fuzzy search files in parent directory of current file {
function! s:fzf_neighbouring_files()
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'ag -g "" -f ' . cwd . ' --depth 0'

  call fzf#run({
        \ 'source'  : command,
        \ 'sink'    : 'e',
        \ 'options' : '-m -x +s',
        \ 'down'    : '40%'
        \ })
endfunction
nnoremap <leader>.n :call <SID>fzf_neighbouring_files() <CR>
" }
