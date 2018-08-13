"======================================================================
"
" init-style.vim - 显示样式设置
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 20:29:07
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------

" 总是显示状态栏
set laststatus=2

" 总是显示行号
set number

" Relative number as defalut
set relativenumber

" Toggle absolute numbering in VIM by insert mode
autocmd InsertEnter * :set norelativenumber

" Toggle relative numbering in VIM by normal mode
autocmd InsertLeave * :set relativenumber

" 总是显示侧边栏（用于显示 mark/gitdiff/诊断信息）
set signcolumn=yes

" 总是显示标签栏
set showtabline=2

" 设置显示制表符等隐藏字符
set list

" 右下角显示命令
set showcmd

" 插入模式在状态栏下面显示 -- INSERT --
" set showmode

" 水平切割窗口时，默认在右边显示新窗口
set splitright

" Only show 15 tabs
set tabpagemax=15

" Highlight current line
set cursorline


"----------------------------------------------------------------------
" 颜色主题：色彩文件位于 colors 目录中
"----------------------------------------------------------------------
if (has("termguicolors"))
  set termguicolors
endif

" 设置黑色背景
" set background=dark

" 允许 256 色
" set t_Co=256

" 设置颜色主题，会在所有 runtimepaths 的 colors 目录寻找同名配置
"
" g:t_vim_colorscheme
if !exists('g:t_vim_colorscheme')
    let g:t_vim_colorscheme = 'space-vim-dark'
endif
exec "colorscheme " . g:t_vim_colorscheme

"----------------------------------------------------------------------
" 更改样式
"----------------------------------------------------------------------

if g:colors_name == "space-vim-dark"

    " prefer the grey comment:
    highlight Comment    guifg=#5C6370   ctermfg=70

    " 去掉 sign column 的白色背景
    highlight SignColumn guibg=NONE ctermbg=NONE

    " 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
    highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
        \ gui=NONE guifg=DarkGrey guibg=NONE


    "   Range:   233 (darkest) ~ 238 (lightest)
    "   Default: 235
    let g:space_vim_dark_background = 234

endif

" 更清晰的错误标注：默认一片红色背景，语法高亮都被搞没了
" 只显示红色或者蓝色下划线或者波浪线
" hi! clear SpellBad
" hi! clear SpellCap
" hi! clear SpellRare
" hi! clear SpellLocal
" if has('gui_running')
"     hi! SpellBad gui=undercurl guisp=red
"     hi! SpellCap gui=undercurl guisp=blue
"     hi! SpellRare gui=undercurl guisp=magenta
"     hi! SpellRare gui=undercurl guisp=cyan
" else
"     hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
"     hi! SpellCap term=underline cterm=underline
"     hi! SpellRare term=underline cterm=underline
"     hi! SpellLocal term=underline cterm=underline
" endif

" 去掉 sign column 的白色背景
" hi! SignColumn guibg=NONE ctermbg=NONE

" 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
"     \ gui=NONE guifg=DarkGrey guibg=NONE

" 修正补全目录的色彩：默认太难看
" hi! Pmenu guibg=gray guifg=black ctermbg=gray ctermfg=black
" hi! PmenuSel guibg=gray guifg=brown ctermbg=brown ctermfg=gray


"
"----------------------------------------------------------------------
" GUI vim setting
"----------------------------------------------------------------------
if GVIM()
    " Remove the toolbar
    set guioptions-=T
    set guioptions-=m
    set lines=40
    if WINDOWS()
        set guifont=Knack_NF:h12,Consolas,Courier_New:h10
    else
        set guifont=Knack_Regular_Nerd_Font_Complete_Mono:h12
    endif

    " Use ~x on an English Windows version or ~n for French.
    if WINDOWS()
        autocmd GUIEnter * simalt ~x
        simalt ~x
    endif
endif


"----------------------------------------------------------------------
" console vim setting
"----------------------------------------------------------------------
" if WINDOWS() && !GVIM()
"     set term=xterm
"     set t_Co=256
"     let &t_AB="\e[48;5;%dm"
"     let &t_AF="\e[38;5;%dm"
" endif
