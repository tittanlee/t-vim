
" GTAGSLABEL 告诉 gtags 默认 C/C++/Java 等六种原生支持的代码直接使用 gtags 本地分析器，而其他语言使用 pygments 模块
"let $GTAGSLABEL = 'native-pygments'

" 环境变量必须设置，否则会找不到 native-pygments 和 language map 的定义,
" Windows 下面在 gtags/share/gtags/gtags.conf，Linux 下要到 /usr/local/share/gtags 里找，
" 也可以把它拷贝成 ~/.globalrc ，Vim 配置的时候方便点。
"if WINDOWS()
"    let $GTAGSCONF = 'C:/Utility/share/gtags/gtags.conf'
"else
"    let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
"endif

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
let g:gutentags_cache_dir = expand('~/.vim/cache/tags')

" 默认禁用自动生成
let g:gutentags_modules = []

" 如果有 ctags 可执行就允许动态生成 ctags 文件
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif

" 如果有 gtags 可执行就允许动态生成 gtags 数据库
if executable('gtags') && executable('gtags-cscope')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 设置 ctags 的参数
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['-R']
let g:gutentags_ctags_extra_args += ['--C-kinds=+defghlmpstuvxz']
let g:gutentags_ctags_extra_args += ['--extra=+q']
let g:gutentags_ctags_extra_args += ['--fields=+niazS']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']

" 使用 universal-ctags 的话需要下面这行，请反注释
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁止 gutentags 自动链接 gtags 数据库
let g:gutentags_auto_add_gtags_cscope = 1

