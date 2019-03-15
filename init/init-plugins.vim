"======================================================================
"
" init-plugins.vim
"
" Created by titan on 2018/07/13
" Last Modified: 2018/07/13 09:57:34
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


if !exists('g:t_vim_bundle_group')
    let g:t_vim_bundle_group =  []
    let g:t_vim_bundle_group += ['vim_util_lib']
    let g:t_vim_bundle_group += ['basic']
    let g:t_vim_bundle_group += ['programming']
    let g:t_vim_bundle_group += ['enhanced']
    let g:t_vim_bundle_group += ['filetypes']
    " let g:t_vim_bundle_group += ['textobj']
    let g:t_vim_bundle_group += ['source_control']
    " let g:t_vim_bundle_group += ['grammer']
    let g:t_vim_bundle_group += ['fuzzy_serach']
    let g:t_vim_bundle_group += ['quickfix_enhanced']
    let g:t_vim_bundle_group += ['youcompleteme']
    "let g:t_vim_bundle_group += ['deoplete']
    let g:t_vim_bundle_group += ['vimsnips']
    let g:t_vim_bundle_group += ['uefi']
endif

"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! s:path(path)
    let path = expand(s:home . '/' . a:path )
    return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------

if !exists('g:t_vim_bundle_home')
    let g:t_vim_bundle_home = '~/.vim/bundles'
endif
call plug#begin(get(g:, 't_vim_bundle_home', '~/.vim/bundles'))


"----------------------------------------------------------------------
" Vim Utility Library function
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'vim_util_lib') >= 0

    "vim: interpret a file by function and cache file automatically
    Plug 'MarcWeber/vim-addon-mw-utils'

    "Some utility functions for VIM
    Plug 'tomtom/tlib_vim'

    " 支持库，给其他插件用的函默认插件 数库
    Plug 'xolox/vim-misc'

endif


"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'basic') >= 0

    " 一次性安装一大堆 colorscheme
    " Plug 'rafi/awesome-vim-colorschemes'
    Plug 'dracula/vim'
    Plug 'ajmwagar/vim-deus'
    Plug 'morhetz/gruvbox'
    Plug 'jacoborus/tender.vim'
    Plug 'rakr/vim-one'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'KeitaNakamura/neodark.vim'
    Plug 'iCyMind/NeoSolarized'
    Plug 'crusoexia/vim-monokai'
    Plug 'liuchengxu/space-vim-dark'
    Plug 'SpaceVim/SpaceVim-theme'
    Plug 'colepeters/spacemacs-theme.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'joshdick/onedark.vim'

    " 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
    Plug 'kshenoy/vim-signature'

    " The ultimate undo history visualizer for VIM
    Plug 'mbbill/undotree'

    " Indent Guides is a plugin for visually displaying indent levels in Vim.
    " Plug 'nathanaelkane/vim-indent-guides'

    " A vim plugin to display the indention levels with thin vertical lines
    Plug 'Yggdroot/indentLine'

    " 文件浏览器，代替 netrw
    " Plug 'justinmk/vim-dirvish', {'on': ['Dirvish'] }

    " A tree explorer plugin for vim.
    Plug 'scrooloose/nerdtree'

    " Extra syntax and highlight for nerdtree files
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " lean & mean status/tabline for vim that's light as air
    Plug 'vim-airline/vim-airline'

    " A collection of themes for vim-airline
    Plug 'vim-airline/vim-airline-themes'

    " Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
    Plug 'ryanoasis/vim-devicons'

    " This plugin provides extended matching for the % operator.
    " Plug 'adelarsq/vim-matchit'

" vim match-up: even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen replacement
    Plug 'andymass/vim-matchup'

    " Vim 中文文檔
    Plug 'yianwillis/vimcdoc'

    " 展示开始画面，显示最近编辑过的文件
    Plug 'mhinz/vim-startify'

endif


"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'enhanced') >= 0

    " 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
    Plug 'terryma/vim-expand-region'

    " 给不同语言提供字典补全，插入模式下 c-x c-k 触发
    " Plug 'asins/vim-dict'

    " 配对括号和引号自动补全
    Plug 'Raimondi/delimitMate'

    " The plugin provides mappings to easily delete, change and add such surroundings in pairs.
    Plug 'tpope/vim-surround'

    " Diff 增强，支持 histogram / patience 等更科学的 diff 算法
    Plug 'chrisbra/vim-diff-enhanced'

    " 多光標操作
    Plug 'terryma/vim-multiple-cursors'

    " Vim commands for copy various bits of the path for the current file
    Plug 'AdamWhittingham/vim-copy-filename'

    " Display the list of buffers in various sort orders
    Plug 'jlanzarotta/bufexplorer'

    " A lightweight implementation of emacs's kill-ring for vim
    Plug 'maxbrunsfeld/vim-yankstack'

    " A Sublime-like minimap for VIM, based on the Drawille console-based drawing library
    Plug 'severin-lemaignan/vim-minimap', {'on': 'Minimap'}

    " Pairs of handy bracket mappings
    Plug 'tpope/vim-unimpaired'

    " A vim plugin for highlighting and navigating through different words in a buffer.
    Plug 'lfv89/vim-interestingwords'

    " Substitute preview
    Plug 'osyo-manga/vim-over'

    " Vim motions on speed!
    Plug 'easymotion/vim-easymotion'

    " Plugin to move lines and selections up and down
    " Plug 'matze/vim-move'

    " 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
    Plug 't9md/vim-choosewin'

    " In Vim, trying to unload, delete or wipe a buffer without closing the window or split?
    Plug 'qpkorr/vim-bufkill'

    " Automatic resizing of Vim windows to the golden ratio
    Plug 'roman/golden-ratio'

endif

"----------------------------------------------------------------------
"  Source control system plugins
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'source_control') >= 0

    " 提供 gist 接口
    Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }

    " 用于在侧边符号栏显示 git/svn 的 diff
    Plug 'mhinz/vim-signify'

    " Git 支持
    Plug 'tpope/vim-fugitive'

endif


"----------------------------------------------------------------------
"  Programming plugins
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'programming') >= 0

    " 自动生成 ctags/gtags，并提供自动索引功能
    " 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
    " 详细用法见：https://zhuanlan.zhihu.com/p/36279445
    " 提供 ctags/gtags 后台数据库自动更新功能
    Plug 'ludovicchabant/vim-gutentags'

    " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
    " 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
    Plug 'skywind3000/gutentags_plus'

    " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
    Plug 'skywind3000/vim-preview', { 'on': ['PreviewTag', 'PreviewQuickfix', 'PreviewClose'] }

    " 表格对齐，使用命令 Tabularize
    Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

    " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
    Plug 'luochen1990/rainbow'

    " Comment functions so powerful—no comment necessary.
    Plug 'scrooloose/nerdcommenter'

    " A class outline viewer for Vim
    Plug 'majutsushi/tagbar'

    " echodoc：搭配 YCM/deoplete 在底部显示函数参数
    " Plug 'Shougo/echodoc.vim'

    " Run Async Shell Commands in Vim 8.0 / NeoVim and Output to Quickfix Window
    Plug 'skywind3000/asyncrun.vim'

endif


"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'textobj') >= 0

    " 基础插件：提供让用户方便的自定义文本对象的接口
    Plug 'kana/vim-textobj-user'

    " indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
    Plug 'kana/vim-textobj-indent'

    " 语法文本对象：iy/ay 基于语法的文本对象
    Plug 'kana/vim-textobj-syntax'

    " 函数文本对象：if/af 支持 c/c++/vim/java
    Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

    " 参数文本对象：i,/a, 包括参数或者列表元素
    Plug 'sgur/vim-textobj-parameter'

    " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
    Plug 'bps/vim-textobj-python', {'for': 'python'}

    " 提供 uri/url 的文本对象，iu/au 表示
    Plug 'jceb/vim-textobj-uri'

endif


"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'filetypes') >= 0

    " A solid language pack for Vim.
    Plug 'sheerun/vim-polyglot'

    " powershell 脚本文件的语法高亮
    " Plug 'pprovost/vim-ps1', { 'for': 'ps1' }

    " lua 语法高亮增强
    " Plug 'tbastos/vim-lua', { 'for': 'lua' }

    " C++ 语法高亮增强，支持 11/14/17 标准
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

    "This is Vim syntax files with C++11 support
    Plug 'vim-jp/vim-cpp' , { 'for': ['c', 'cpp'] }

    " 额外语法文件
    Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

    " python 语法文件增强
    Plug 'vim-python/python-syntax', { 'for': ['python'] }

    " rust 语法增强
    " Plug 'rust-lang/rust.vim', { 'for': 'rust' }

    " vim org-mode
    " Plug 'jceb/vim-orgmode', { 'for': 'org' }

endif

"----------------------------------------------------------------------
" LanguageTool 语法检查
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'grammer') >= 0

    " A powerful grammar checker for Vim using LanguageTool.
    Plug 'rhysd/vim-grammarous'

    Plug 'w0rp/ale', { 'on':  'ALEToggle' }

endif

"----------------------------------------------------------------------
" Fuzzy search plugins group
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'fuzzy_serach') >= 0

    " 如果 vim 支持 python 则启用  Leaderf
    if has('python') || has('python3')

        " An asynchronous fuzzy finder which is used to quickly locate files, buffers, mrus, tags, etc. in large project.
        Plug 'Yggdroot/LeaderF'

        " leaderf <c-]> tag jump
        Plug 'tittanlee/LeaderF-tjump'

        " LeaderF extenstion for ripgrep
        Plug 'bstaint/LeaderF-grep'

    else

        " 不支持 python ，使用 CtrlP 代替
        Plug 'ctrlpvim/ctrlp.vim'

        " 显示函数列表的扩展插件
        Plug 'tacahiroy/ctrlp-funky'

    endif

    " 快速文件搜索
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " Things you can do with fzf and Vim.
    Plug 'junegunn/fzf.vim'

    " 使用 :FlyGrep 命令进行实时 grep
    " Plug 'wsdjeg/FlyGrep.vim'

    " 使用 :CtrlSF 命令进行模仿 sublime 的 grep
    Plug 'dyng/ctrlsf.vim'

    " Use your favorite grep tool (ag, ack, git grep, ripgrep, pt, sift, findstr, grep) to start an asynchronous search.
    " All matches will be put in a quickfix or location list.
    Plug 'mhinz/vim-grepper'

    " Vim search status.
    Plug 'osyo-manga/vim-anzu'

endif

"----------------------------------------------------------------------
" Quickfix window enhanced - Mulitple open files and filter qf reslut.
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'quickfix_enhanced') >= 0

    " Open a Quickfix item in a window you choose. (Vim plugin)
    Plug 'yssl/QFEnter'

    " Tame the quickfix window
    " Plug 'romainl/vim-qf'

    " Edit the quickfix/location list freely
    " Plug 'itchyny/vim-qfedit'

endif

"----------------------------------------------------------------------
" YoucompletetMe vim 自動補全套件
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'youcompleteme') >= 0

    " YCM plugin
    Plug 'Valloric/YouCompleteMe'

    " Complete parameter after select the completion. Integration with YouCompleteMe(ycm), deoplete, neocomplete.
    Plug 'tenfyzhong/CompleteParameter.vim'

endif


"----------------------------------------------------------------------
" deoplete.nvim vim 自動補全套件
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'deoplete') >= 0
    if NVIM()
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
endif


"----------------------------------------------------------------------
" Sinps plugin package
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'vimsnips') >= 0

    " Track the engine.
    Plug 'SirVer/ultisnips'

    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets'

endif


"----------------------------------------------------------------------
" UEFI 語法高亮
"----------------------------------------------------------------------
if index(g:t_vim_bundle_group, 'uefi') >= 0

    Plug 'martinlroth/vim-acpi-asl'
    Plug 'tittanlee/vim_for_UEFI'
    "Plug 'fedorov7/vim-uefi'
    
    " Vim plugin for generating and inserting UUIDs
    Plug 'kburdett/vim-nuuid'

endif

"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()
