
"
" Desc : Plugig list
" File : plugins.vim
"

" get the plugin bundle directory {{{
    if !exists('g:t_vim_bundle_home')
        let g:t_vim_bundle_home = '~/.vim/bundles'
    endif
" }}}

" vim plugins list groups {{{
    if !exists('g:t_vim_bundle_group')
        let g:t_vim_bundle_group =  []
        let g:t_vim_bundle_group += ['color_scheme']
        let g:t_vim_bundle_group += ['modern_ux']
        let g:t_vim_bundle_group += ['basic_enhanced']
        let g:t_vim_bundle_group += ['buffer_related']
        let g:t_vim_bundle_group += ['file_explorer']
        " let g:t_vim_bundle_group += ['text_object']
        let g:t_vim_bundle_group += ['programming']
        let g:t_vim_bundle_group += ['filetypes']
        let g:t_vim_bundle_group += ['source_control']
        let g:t_vim_bundle_group += ['fuzzy_serach']
        let g:t_vim_bundle_group += ['coc']
        let g:t_vim_bundle_group += ['snippets']
        let g:t_vim_bundle_group += ['uefi']
    endif
" }}}


" vim-plug - Vim plugin manager {{{
call plug#begin(get(g:, 't_vim_bundle_home', '~/.vim/bundles'))

    " g:t_vim_bundle_group['color_scheme'] {{{
        if index(g:t_vim_bundle_group, 'color_scheme') >= 0
            " gruvbox9 colorscheme for neovim/vim
            Plug 'lifepillar/vim-gruvbox8'

            " A simplified and optimized Gruvbox colorscheme for Vim
            Plug 'hardcoreplayers/gruvbox9'

            " A dark theme for Vim https://draculatheme.com/vim
            Plug 'dracula/vim', { 'as': 'dracula' }

            " Low-contrast Vim color scheme based on Seoul Colors
            Plug 'junegunn/seoul256.vim', { 'as': 'seoul256' }

            " High Contrast & Vivid Color Scheme based on Monokai Pro
            Plug 'sainnhe/sonokai'

            " Hydrangea theme for Vim.
            Plug 'yuttie/hydrangea-vim'

            " Clean & Elegant Color Scheme inspired by Atom One and Material
            Plug 'sainnhe/edge'

            " Dark blue color scheme for Vim and Neovim
            Plug 'cocopon/iceberg.vim'
        endif
    " }}}

    " g:t_vim_bundle_group['modern_ux'] {{{
        if index(g:t_vim_bundle_group, 'modern_ux') >= 0
            " Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
            Plug 'ryanoasis/vim-devicons'

            " Filetype icons for https://github.com/Shougo/defx.nvim
            Plug 'kristijanhusak/defx-icons'

            " A light and configurablevstatusline/tabline plugin for Vim
            Plug 'itchyny/lightline.vim', { 'as': 'lightline'}

            " A lightweight plugin to display the list of buffers in the lightline vim plugin
            "Plug 'mengelbrecht/lightline-bufferline'
        endif
    " }}}

    " g:t_vim_bundle_group['basic_enhanced'] {{{
        if index(g:t_vim_bundle_group, 'basic_enhanced') >= 0
            "vim match-up: even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen replacemen
            Plug 'andymass/vim-matchup'

            " Plugin to toggle, display and navigate marks
            Plug 'kshenoy/vim-signature'

            " A vim plugin to display the indention levels with thin vertical lines
            Plug 'Yggdroot/indentLine'

            " Multiple cursors plugin for vim/neovim
            Plug 'mg979/vim-visual-multi'

            " The plugin provides mappings to easily delete, change and add such surroundings in pairs.
            Plug 'tpope/vim-surround'

            " repeat.vim: enable repeating supported plugin maps with "."
            Plug 'tpope/vim-repeat'

            " Diff 增强，支持 histogram / patience 等更科学的 diff 算法
            Plug 'chrisbra/vim-diff-enhanced'

            " Vim commands for copy various bits of the path for the current file
            Plug 'AdamWhittingham/vim-copy-filename'

            " A vim plugin for highlighting and navigating through different words in a buffer.
            Plug 'lfv89/vim-interestingwords'

            " quickly highlight <cword> or visually selected word
            Plug 't9md/vim-quickhl'

            " Vim motions on speed!
            Plug 'easymotion/vim-easymotion'

            " Vim script for text filtering and alignment
            Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

            " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
            Plug 'luochen1990/rainbow'

            " The missing sidebar manager for Vim/Neovim
            Plug 'brglng/vim-sidebar-manager'

        endif
    " }}}

    " g:t_vim_bundle_group['buffer_related'] {{{
        if index(g:t_vim_bundle_group, 'buffer_related') >= 0
            " Display the list of buffers in various sort orders
            Plug 'jlanzarotta/bufexplorer'

            " Delete buffers and close files in Vim without closing your windows or messing up your layout. Like Bclose.vim
            Plug 'moll/vim-bbye'
        endif
    " }}}

    " g:t_vim_bundle_group['file_explorer'] {{{
        if index(g:t_vim_bundle_group, 'file_explorer') >= 0
            " The dark powered file explorer implementation
            Plug 'Shougo/defx.nvim', { 'as': 'defx', 'on': 'Defx', 'do': ':UpdateRemotePlugins' }
            if !has('nvim')
                Plug 'roxma/nvim-yarp'
                Plug 'roxma/vim-hug-neovim-rpc'
            endif
        endif
    " }}}

    " g:t_vim_bundle_group['text_object'] {{{
        if index(g:t_vim_bundle_group, 'text_object') >= 0
            Plug 'AndrewRadev/splitjoin.vim'
            Plug 'terryma/vim-expand-region'
            Plug 'kana/vim-textobj-user'
            Plug 'kana/vim-operator-user'
        endif
    " }}}

    " g:t_vim_bundle_group['programming'] {{{
        if index(g:t_vim_bundle_group, 'programming') >= 0
            " A Vim plugin that manages your tag files https://bolt80.com/gutentags/
            Plug 'ludovicchabant/vim-gutentags'

            " The right way to use gtags with gutentags
            "Plug 'skywind3000/gutentags_plus'

            " The missing preview window for vim
            "Plug 'skywind3000/vim-preview'

            " Comment functions so powerful—no comment necessary.
            Plug 'scrooloose/nerdcommenter'

        endif
    " }}}

    " g:t_vim_bundle_group['filetypes'] {{{
        if index(g:t_vim_bundle_group, 'filetypes') >= 0
            " A solid language pack for Vim.
            Plug 'sheerun/vim-polyglot'
        endif
    " }}}

    " g:t_vim_bundle_group['source_control'] {{{
        if index(g:t_vim_bundle_group, 'source_control') >= 0
            " Show a diff using Vim its sign column.
            "Plug 'mhinz/vim-signify'

            " fugitive.vim: A Git wrapper so awesome, it should be illegal
            Plug 'tpope/vim-fugitive'
        endif
    " }}}

    " g:t_vim_bundle_group['fuzzy_serach'] {{{
        if index(g:t_vim_bundle_group, 'fuzzy_serach') >= 0
            if !(has('win32') || has('win64'))
                " A command-line fuzzy finder
                Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            else
                Plug 'junegunn/fzf'
            endif

            " fzf ❤️ vim
            Plug 'junegunn/fzf.vim'

            " fzf-tags bridges the gap between tags and fzf.vim.
            Plug 'tittanlee/fzf-tags'

            " Vim plugin to improve project searching with tools like ag and rg
            "Plug 'jesseleite/vim-agriculture'

            " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
            Plug 'dyng/ctrlsf.vim', { 'as': 'ctrlsf' }

            " An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly for both vim and neovim.
            "Plug 'Yggdroot/LeaderF'

            " Vim search status.
            "Plug 'osyo-manga/vim-anzu'
        endif
    " }}}

    " g:t_vim_bundle_group['coc'] {{{
        if index(g:t_vim_bundle_group, 'coc') >= 0
            " Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode
            Plug 'neoclide/coc.nvim', {'as': 'coc', 'branch': 'release'}
        endif
    " }}}

    " g:t_vim_bundle_group['snippets'] {{{
        if index(g:t_vim_bundle_group, 'snippets') >= 0
            " Snippets are separated from the engine. Add this if you want them:
            Plug 'honza/vim-snippets'

            " UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
            "Plug 'SirVer/ultisnips'
        endif
    " }}}

    " g:t_vim_bundle_group['uefi'] {{{
        if index(g:t_vim_bundle_group, 'uefi') >= 0
            " Syntax highlighting and filetype detection for BIOS programmer
            Plug 'aphroteus/vim-uefi'

            " Vim plugin for generating and inserting UUIDs
            " Plug 'kburdett/vim-nuuid'
        endif
    " }}}

call plug#end()
" }}}
