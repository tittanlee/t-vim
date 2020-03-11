"======================================================================
"
" init-keymaps.vim - Personsally key mapping configuration
"
" Created by titan on 2018/07/13
" Last Modified: 2018/07/13 09:57:34
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" VIM normale command start key
"----------------------------------------------------------------------
nmap ; :

"----------------------------------------------------------------------
" Switch window
"----------------------------------------------------------------------
nnoremap <silent> <C-left>  <C-w>h
nnoremap <silent> <C-down>  <C-w>j
nnoremap <silent> <C-up>    <C-w>k
nnoremap <silent> <C-right> <C-w>l

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

"----------------------------------------------------------------------
" Switch buffer tab
"----------------------------------------------------------------------
nmap <M-h>     : bp <CR> zz
nmap <M-l>     : bn <CR> zz
nmap <M-left>  : bp <CR> zz
nmap <M-right> : bn <CR> zz

"----------------------------------------------------------------------
" Wipe the current buffer
"----------------------------------------------------------------------
if index(g:plugs_order, 'vim-bufkill') >= 0
    nmap <M-w>     : BW <CR>
else
    nmap <M-w>     : bw <CR>
endif

"----------------------------------------------------------------------
" Move cursor on inser mode
"----------------------------------------------------------------------
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>

"----------------------------------------------------------------------
"QuickFix window open and close
"----------------------------------------------------------------------
nnoremap <silent> <leader>q :call QFixToggle(1)<CR>
nnoremap <silent> <leader><leader>q :copen \| wincmd L<CR>

"----------------------------------------------------------------------
" Go to next function block and focus on middle screen
"----------------------------------------------------------------------
nmap ]] ]]zz
nmap [[ [[zz

"----------------------------------------------------------------------
" Mapping jk as ESC key on insert mode
"----------------------------------------------------------------------
inoremap jk <ESC>

"----------------------------------------------------------------------
" Split windows
"----------------------------------------------------------------------
nmap sh :split<CR>
nmap sv :vsplit<CR>

"----------------------------------------------------------------------
" Source MYVIMRC
"----------------------------------------------------------------------
noremap  <leader>sv  :source $MYVIMRC <CR>

"----------------------------------------------------------------------
" Source current vim script
"----------------------------------------------------------------------
noremap  <leader>sc  :source % <CR>

"----------------------------------------------------------------------
" Edit vimrc
"----------------------------------------------------------------------
noremap  <leader>ev  :e $MYVIMRC <CR>

"----------------------------------------------------------------------
" To move lines and selections up and down
"----------------------------------------------------------------------
vnoremap <A-k> :move '<-2<cr>gv=gv
vnoremap <A-j> :move '>+1<cr>gv=gv

"----------------------------------------------------------------------
" F1 ~ F12 key mapping
"----------------------------------------------------------------------

"<F2> Save
nmap <F2> :w! <CR>
imap <F2> <ESC>:w! <CR>

"<F4>Quit
nmap <F4> :q! <CR>

" <F6> Replace words
nmap <F6> :<C-R>=line('.')<CR>,$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
cmap <F6> <Esc> :line('.'),$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
imap <F6> <Esc> :line('.'),$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
vmap <F6> <Esc> :line('.'),$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
omap <F6> <Esc> :line('.'),$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>

" <F7> HighLight on/off switch quickly.
nmap <F7> :nohl <CR>
cmap <F7> <Esc> :nohl <CR>
imap <F7> <Esc> :nohl <CR>
vmap <F7> <Esc> :nohl <CR>
omap <F7> <Esc> :nohl <CR>


" <F8> Generate the tags and gtags.
nmap <F8> :GutentagsUpdate! <CR>
cmap <F8> <Esc> :GutentagsUpdate! <CR>
imap <F8> <Esc> :GutentagsUpdate! <CR>
vmap <F8> <Esc> :GutentagsUpdate! <CR>
omap <F8> <Esc> :GutentagsUpdate! <CR>



" <F9> TagbarClose and NERDTreeClose
nnoremap <expr> <F9>    IsTagbarOrNerdTreeOpen()?  "\<ESC>:NERDTreeClose \| TagbarClose<CR>" : "\<ESC>:NERDTree \| Tagbar<CR>"

" <F10> Show syntax highlighting group under cursor.
" http://vim.wikia.com/wiki/VimTip99
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" <F12> strip the trailing whitespace
nmap <F12> :call StripTrailingWhitespace()

