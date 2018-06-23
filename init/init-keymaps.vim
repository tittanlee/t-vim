"======================================================================
"
" init-keymaps.vim - 按键设置，按你喜欢更改
"
"   - 快速移动
"   - 标签切换
"   - 窗口切换
"   - 终端支持
"   - 编译运行
"   - 符号搜索
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 17:59:31
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" Switch cusor focus
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
"Switch buffer tab
"----------------------------------------------------------------------
nmap <A-h>     : bp <CR> zz
nmap <A-l>     : bn <CR> zz
nmap <A-left>  : bp <CR> zz
nmap <A-right> : bn <CR> zz
nmap <A-w>     : bw <CR>


"----------------------------------------------------------------------
"QucikFix window open and close
"----------------------------------------------------------------------
nmap <A-k>    : copen<CR>
nmap <A-j>    : cclose<CR>
nmap <A-up>   : copen<CR>
nmap <A-down> : cclose<CR>


"----------------------------------------------------------------------
"Focus on middle screen
"----------------------------------------------------------------------
nmap ]] ]]zz
nmap [[ [[zz

"----------------------------------------------------------------------
"Split windows
"----------------------------------------------------------------------
nmap sh :split<CR>
nmap sv :vsplit<CR>

"Locad and edit vimrc key mapping
noremap  <leader>sv  :source $MYVIMRC <CR>

"----------------------------------------------------------------------
" F1 ~ F12 key mapping
"----------------------------------------------------------------------

"<F2> Save
nmap <F2> :w! <CR>

"<F4>Quit
nmap <F4> :q! <CR>

" <F6> Replace words
nmap <F6> :1,$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
cmap <F6> <Esc> :1,$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
imap <F6> <Esc> :1,$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
vmap <F6> <Esc> :1,$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>
omap <F6> <Esc> :1,$s/<C-R>=expand("<cword>")<CR>//gic<left><left><left><left>

" <F10> Show syntax highlighting group under cursor.
" http://vim.wikia.com/wiki/VimTip99
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" <F12> strip the trailing whitespace
nmap <F12> :call StripTrailingWhitespace()

