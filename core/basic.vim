
"
" Desc : Command options for basic setting
" File : basic.vim
"

" 1. important {{{
    set nocompatible

    " Regular Vim doesn't add custom configuration directories, if you use one
    " Insert the t_vim_root at prefix.
    if &runtimepath !~# g:t_vim_root
        exec 'set rtp ^='.g:t_vim_root
    endif
" }}}

" 24 multi-byte characters {{{
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1,utf-16le,cp1252,iso-8859-15
" }}}

" 2. moving around, searching and patterns {{{
    set noautochdir
    set ignorecase
    set smartcase
    set incsearch
" }}}

" 3. tags {{{
    set tags=./.tags;,.tags
" }}}

" 4. displaying text {{{
    set cmdheight=1
    set lazyredraw
    set list
    set listchars=tab:→\ ,nbsp:.,trail:•,extends:⟩,precedes:⟨
    set showbreak=↪\
    set number
    set relativenumber
" }}}

" 5. syntax, highlighting and spelling {{{
    set hlsearch
    set cursorline
" }}}

" 6. multiple windows {{{
    set laststatus=2
    set splitright
    set splitbelow
    set hidden
" }}}

" 7. multiple tab pages {{{
    set showtabline=2
" }}}

" 8. terminal {{{
    set ttyfast
    if has('termguicolors')
        set termguicolors
    endif
" }}}

" 9. using the mouse {{{
    set mouse=a
    set mousehide
" }}}

" 10 printing {{{
" }}}

" 11 messages and info {{{
    set shortmess+=c
" }}}

" 12 selecting text {{{
    if has('clipboard')
        if has('unnamedplus')
            " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else
            " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif
" }}}


" 13 editing text {{{
    set backspace=indent,eol,start
    set noundofile
    set showmatch
    set completeopt=longest,menu
    set completeopt-=preview
" }}}

" 14 tabs and indenting {{{
    set tabstop=4
    set shiftwidth=4
    set smarttab
    set softtabstop=4
    set expandtab
    set smartindent
    set cindent
" }}}


" 15 folding {{{
    set foldenable
    set foldcolumn=2
" }}}

" 16 diff mode {{{
" }}}

" 17 mapping {{{
    set ttimeout
    set ttimeoutlen=80
" }}}

" 18 reading and writing files {{{
    set fileformat=unix
    set fileformats=unix,mac,dos
    set nowritebackup
    set nobackup
" }}}

" 19 the swap file {{{
    set noswapfile
    set updatetime=300
" }}}

" 20 command line editing {{{
    set wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*
    if !has('nvim')
        set wildmenu
        set wildmode=list,full
    endif
" }}}

" 21 executing external commands {{{
" }}}


" 22 running make and jumping to errors {{{
    set grepprg=rg\ --vimgrep\ $*
" }}}

" 23 language specific {{{
" }}}

" 25 various {{{
    set signcolumn=yes
" }}}



" Vim Misc {{{
    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif
" }}}
