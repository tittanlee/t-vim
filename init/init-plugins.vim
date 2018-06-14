"======================================================================
"
" init-plugins.vim - 
"
" Created by skywind on 2018/05/31
" Last Modified: 2018/06/10 23:11
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


if !exists('g:bundle_group')
    let g:bundle_group = ['basic', 'programming', 'enhanced', 'filetypes', 'textobj']
    let g:bundle_group += ['tags', 'grammer']
    let g:bundle_group += ['fuzzy_serach']
    let g:bundle_group += ['uefi']
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
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))


"----------------------------------------------------------------------
" 默认插件 
"----------------------------------------------------------------------

"vim: interpret a file by function and cache file automatically
Plug 'MarcWeber/vim-addon-mw-utils'

"Some utility functions for VIM
Plug 'tomtom/tlib_vim'

" 全文快速移动，<leader><leader>f{char} 即可触发
Plug 'easymotion/vim-easymotion'

" 文件浏览器，代替 netrw
Plug 'justinmk/vim-dirvish'


" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'

"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0

    " 展示开始画面，显示最近编辑过的文件
    Plug 'mhinz/vim-startify'

    " 一次性安装一大堆 colorscheme
    Plug 'rafi/awesome-vim-colorschemes'

    " 支持库，给其他插件用的函数库
    Plug 'xolox/vim-misc'

    " 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
    Plug 'kshenoy/vim-signature'

    " 用于在侧边符号栏显示 git/svn 的 diff
    Plug 'mhinz/vim-signify'

    " The ultimate undo history visualizer for VIM 
    Plug 'mbbill/undotree'

    " Indent Guides is a plugin for visually displaying indent levels in Vim.
    Plug 'nathanaelkane/vim-indent-guides'

    " A tree explorer plugin for vim.
    Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }

    " Extra syntax and highlight for nerdtree files
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " lean & mean status/tabline for vim that's light as air
    Plug 'vim-airline/vim-airline'

    " A collection of themes for vim-airline
    Plug 'vim-airline/vim-airline-themes'

    " This plugin provides extended matching for the % operator.
    plug 'adelarsq/vim-matchit'

endif


"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

    " 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
    Plug 'terryma/vim-expand-region'

    " 给不同语言提供字典补全，插入模式下 c-x c-k 触发
    Plug 'asins/vim-dict'

    " 使用 :FlyGrep 命令进行实时 grep
    Plug 'wsdjeg/FlyGrep.vim'

    " 使用 :CtrlSF 命令进行模仿 sublime 的 grep
    Plug 'dyng/ctrlsf.vim'

    " 配对括号和引号自动补全
    Plug 'Raimondi/delimitMate'

    " 提供 gist 接口
    Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }

endif


"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'programming') >= 0

    " 提供 ctags/gtags 后台数据库自动更新功能
    Plug 'ludovicchabant/vim-gutentags'

    " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
    " 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
    Plug 'skywind3000/gutentags_plus'

    " 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
    " 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
    Plug 'mh21/errormarker.vim'

    " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
    Plug 'skywind3000/vim-preview'

    " Git 支持
    Plug 'tpope/vim-fugitive'

    " 表格对齐，使用命令 Tabularize
    Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

    " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
    Plug 'luochen1990/rainbow'

    " Comment functions so powerful—no comment necessary.
    Plug 'scrooloose/nerdcommenter'

    " A class outline viewer for Vim
    Plug 'majutsushi/tagbar'

    " echodoc：搭配 YCM/deoplete 在底部显示函数参数
    Plug 'Shougo/echodoc.vim'
endif


"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj')

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
if index(g:bundle_group, 'filetypes') >= 0

    " powershell 脚本文件的语法高亮
    Plug 'pprovost/vim-ps1', { 'for': 'ps1' }

    " lua 语法高亮增强
    Plug 'tbastos/vim-lua', { 'for': 'lua' }

    " C++ 语法高亮增强，支持 11/14/17 标准
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

    "This is Vim syntax files with C++11 support
    Plug 'vim-jp/vim-cpp' , { 'for': ['c', 'cpp']' }

    " 额外语法文件
    Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

    " python 语法文件增强
    Plug 'vim-python/python-syntax', { 'for': ['python'] }

    " rust 语法增强
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }

    " vim org-mode 
    Plug 'jceb/vim-orgmode', { 'for': 'org' }

endif

"----------------------------------------------------------------------
" LanguageTool 语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'grammer') >= 0

    Plug 'rhysd/vim-grammarous'

    Plug 'w0rp/ale'

endif

"----------------------------------------------------------------------
" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
if index(g:bundle_group, 'fuzzy_serach') >= 0

    " 如果 vim 支持 python 则启用  Leaderf
    if has('python') || has('python3')
        Plug 'Yggdroot/LeaderF'
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

endif


if index(g:bundle_group, 'uefi') >= 0

    Plug 'martinlroth/vim-acpi-asl'
    Plug 'fedorov7/vim-uefi'

endif

"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()
