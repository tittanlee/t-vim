" fzf drop down
let g:fzf_layout         = { 'down': '~30%' }
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
"let g:fzf_tags_command   = 'ctags --extra=+f -R'

" fzf mappings
nnoremap <C-P>       :Files<CR>
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
nnoremap <silent> <leader>ag :call fzf#vim#ag(expand('<cword>'))<CR>
nnoremap <leader>j :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Customize fzf colors to match your color scheme
"let g:fzf_colors = {
"            \ "fg":      ["fg", "Normal"],
"            \ "bg":      ["bg", "Normal"],
"            \ "hl":      ["fg", "IncSearch"],
"            \ "fg+":     ["fg", "CursorLine", "CursorColumn", "Normal"],
"            \ "bg+":     ["bg", "CursorLine", "CursorColumn"],
"            \ "hl+":     ["fg", "IncSearch"],
"            \ "info":    ["fg", "IncSearch"],
"            \ "border":  ["fg", "Ignore"],
"            \ "prompt":  ["fg", "Comment"],
"            \ "pointer": ["fg", "IncSearch"],
"            \ "marker":  ["fg", "IncSearch"],
"            \ "spinner": ["fg", "IncSearch"],
"            \ "header":  ["fg", "WildMenu"] }

