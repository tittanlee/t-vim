
"
" Desc : General key mapping
" File : keymap.vim
"

" General key mapping {{{

    " Global Mappings "{{{
        " Use spacebar as leader and ; as secondary-leader
        " Required before loading plugins!
        let mapleader = "\<Space>"
        let maplocalleader = ';'
    " }}}

    " Use <TAB> as generic leader key map {{{
        " Use Tab with hjkl key jump between windows {{{
            nnoremap <silent> <Tab>h :<C-u>wincmd h<CR>
            nnoremap <silent> <Tab>j :<C-u>wincmd j<CR>
            nnoremap <silent> <Tab>k :<C-u>wincmd k<CR>
            nnoremap <silent> <Tab>l :<C-u>wincmd l<CR>
        " }}}

        " File operation {{{
            nnoremap <Tab>w :w! <CR>
            nnoremap <Tab>q :q! <CR>
        " }}}

        " Keep only window {{{
            nnoremap <Tab>o :only <CR>
        " }}}

        " Source current vim {{{
            nnoremap <Tab>sc :so%<CR>
        " }}}
    " }}}

    " Buffer control - switch and wipe {{{
        nnoremap <silent> <M-h> :bp <CR>
        nnoremap <silent> <M-l> :bn <CR>
        nnoremap <silent> <M-w> :bd <CR>
    " }}}

    " Use jk switch to normal mode {{{
        inoremap jk <ESC>
        cnoremap jk <ESC>
        vnoremap jk <ESC>
    " }}}

    " split vertical {{{
        nnoremap sv :vsplit <CR>
        nnoremap sh :split <CR>
    " }}}

    " neovim paste remapping to shift+insert {{{
        inoremap <S-Insert> <C-r>+
        cnoremap <S-Insert> <C-r>+
        tnoremap <S-Insert> <C-r>+
    " }}}

    " folding qucik key map {{{
        nnoremap z0 :set foldlevel=0 <CR>
        nnoremap z1 :set foldlevel=1 <CR>
        nnoremap z2 :set foldlevel=2 <CR>
        nnoremap z3 :set foldlevel=3 <CR>
        nnoremap z4 :set foldlevel=4 <CR>
        nnoremap z5 :set foldlevel=5 <CR>
        nnoremap z6 :set foldlevel=6 <CR>
        nnoremap z7 :set foldlevel=7 <CR>
        nnoremap z8 :set foldlevel=8 <CR>
        nnoremap z9 :set foldlevel=9 <CR>
    " }}}

    " <F2> Save {{{
        nnoremap <F2>   :w! <CR>
        inoremap <F2>   <ESC> :w! <CR>
    " }}}

    " <F4> Quit {{{
        nnoremap <F4>   :q! <CR>
    " }}}

    " <F7> Highligh toggle {{{
        nmap <F7> :nohl <CR>
        imap <F7> <Esc> :nohl <CR>
    " }}}

" }}}
