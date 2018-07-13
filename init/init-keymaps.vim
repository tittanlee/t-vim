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
nmap <silent> <C-left>  <C-w>h
nmap <silent> <C-down>  <C-w>j
nmap <silent> <C-up>    <C-w>k
nmap <silent> <C-right> <C-w>l

nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

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
nmap <M-w>     : bw <CR>

"----------------------------------------------------------------------
" Move cursor on inser mode
"----------------------------------------------------------------------
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>

"----------------------------------------------------------------------
"QucikFix window open and close
"----------------------------------------------------------------------
nmap <M-k>    : copen<CR>
nmap <M-j>    : cclose<CR>
nmap <M-up>   : copen<CR>
nmap <M-down> : cclose<CR>


"----------------------------------------------------------------------
" Go to next function block and focus on middle screen
"----------------------------------------------------------------------
nmap ]] ]]zz
nmap [[ [[zz

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
" F1 ~ F12 key mapping
"----------------------------------------------------------------------

"<F2> Save
nmap <F2> :w! <CR>

"<F4>Quit
nmap <F4> :q! <CR>

" <F6> Replace words
nmap <F6> :<C-R>=line('.')<CR>,$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
cmap <F6> <Esc> :line('.'),$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
imap <F6> <Esc> :line('.'),$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
vmap <F6> <Esc> :line('.'),$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
omap <F6> <Esc> :line('.'),$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>

" <F10> Show syntax highlighting group under cursor.
" http://vim.wikia.com/wiki/VimTip99
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" <F12> strip the trailing whitespace
nmap <F12> :call StripTrailingWhitespace()

