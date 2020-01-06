" fzf drop down
let g:fzf_layout         = { 'down': '~40%' }
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore -g !.git/*'
let $FZF_DEFAULT_OPTS    = '--layout=reverse-list --border'


" 打开 fzf 的方式选择 floating window
if NVIM()

let g:fzf_layout = { 'window': 'call FloatingFZF()'}
    
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let winheight = winheight(0)
  let winwidth = winwidth(0)

  let width = float2nr(winwidth-(winwidth*2/10))

  let opts = {
        \ 'relative': 'editor',
        \ 'row': &lines - 3,
        \ 'col': float2nr((winwidth-width)/2),
        \ 'width': width,
        \ 'height': &lines - 3
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

endif

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

" let g:fzf_colors =
"             \ { 'fg':      ['fg', 'Normal'],
"             \ 'bg':      ['bg', 'Normal'],
"             \ 'hl':      ['fg', 'Type'],
"             \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"             \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"             \ 'hl+':     ['fg', 'Identifier'],
"             \ 'info':    ['fg', 'PreProc'],
"             \ 'prompt':  ['fg', 'Conditional'],
"             \ 'pointer': ['fg', 'Exception'],
"             \ 'marker':  ['fg', 'Keyword'],
"             \ 'spinner': ['fg', 'Label'],
"             \ 'header':  ['fg', 'Comment'] }
"

" fzf mappings
nnoremap <C-p>  :Files<CR>
nnoremap <Leader>/  :Lines<CR>
nnoremap <Leader><Leader>t  :Tags<CR>
nnoremap <Leader><Leader>b  :Buffers<CR>
nnoremap <Leader><Leader>c  :Commands<CR>
nnoremap <Leader><Leader>w  :Windows<CR>
nnoremap <Leader><Leader>a  :Ag<CR>
nnoremap <Leader><Leader>g  :GitFiles<CR>
nnoremap <Leader><Leader>o  :Locate<Space>
nnoremap <Leader><Leader>m  :Maps<CR>
nnoremap <Leader><Leader>h  :History<CR>
nnoremap <Leader><Leader>s  :Snippets<CR>
nnoremap <Leader><Leader>i  :Commits<CR>
nnoremap <Leader><Leader>r  :Colors<CR>
nnoremap <Leader><Leader>e  :Helptags<CR>
nnoremap <Leader><Leader>..c :BCommits<CR>
nnoremap t :BTags<CR>
nnoremap <Leader><leader>bl :BLines<CR>

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

"
" Fzf jump to tag {
"
" Extract the trimmed cmd string between prefix and suffix
" Valid tag cmd prefixes: /^ | ?^ | / | ?
" Valid tag cmd suffixes: $/ | $? | / | ?
function! s:short_cmd(tgi)
    let short_cmd = substitute(a:tgi['cmd'], '\v^(/\^|\?\^|/|\?)?\s*(.{-})\s*(\$/|\$\?|/|\?)?$', '\2', '')
    return short_cmd
endfunction

function! s:Fzf_tjump_source()
    let TagSort = []
    let s:word = expand('<cword>')
    let s:taglist = taglist('^'.s:word.'$')
    let s:index = 1

    for tgi in s:taglist
        let tgi['short_cmd'] = s:short_cmd(tgi)
        let tgi['short_filename'] = tgi['filename']
        call add(TagSort, printf ("%-4d %-5d %-80s %s", s:index, tgi['line'], tgi['short_filename'], tgi['short_cmd']))
        let s:index += 1
    endfo

    return TagSort
endfunction

function! s:tags_sink(string)
    let tagIndex = split(a:string, '\zs')[0]

    let cstopt = &cst
    set nocst
    exec ":silent! ".tagIndex."tag ".s:word
    let &cst = cstopt
endfunction

function! s:fzf_tjump()
    call fzf#run({
                \ 'source':  s:Fzf_tjump_source(),
                \ 'down':    '40%',
                \ 'sink':    function('s:tags_sink')
                \ })
endfunction
nnoremap <leader><leader>j  :call <SID>fzf_tjump() <CR>
" }
