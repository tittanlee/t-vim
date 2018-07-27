" CTRL+p 打开文件模糊匹配
let g:Lf_ShortcutF = '<c-p>'

" ALT+n 打开 buffer 模糊匹配
let g:Lf_ShortcutB = '<m-n>'

" Set this to 2 or 3 to specify the version of Python
"let g:Lf_PythonVersion = 2

" Use this option to specify whether to show the preview of the code the tag
" locates in when navigating the tags.
let g:Lf_PreviewCode = 0

" 显示绝对路径
let g:Lf_ShowRelativePath = 1

" Setting this option can change the position of the LeaderF window.
"'top' - the LeaderF window is at the top of the screen.
"'bottom' - the LeaderF window is at the bottom of the screen.
"'left' - the LeaderF window is at the left of the screen.
"'right' - the LeaderF window is at the right of the screen.
let g:Lf_WindowPosition = 'bottom'

" Use this option to specify the default external tool which is used to index the files.
let g:Lf_DefaultExternalTool = "rg"

"This option specifies whether to use version control tool to index the files when inside a repository under control.
let g:Lf_UseVersionControlTool = 0

" Use this option to specify a external command to index the files
let g:Lf_ExternalCommand = 'rg --files --no-ignore --hidden -g !.git "%s"'

" 最大历史文件保存 2048 个
let g:Lf_MruMaxFiles = 2048

" ui 定制
" let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_StlSeparator = { 'left': "\uE0B0", 'right': "\uE0B2" }

" 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.40
let g:Lf_CacheDirectory = expand('~/.vim/cache')

" 隐藏帮助
let g:Lf_HideHelp = 1

" 模糊匹配忽略扩展名
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \ }

" MRU 文件忽略扩展名
let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
let g:Lf_StlColorscheme = 'powerline'

" 禁用 function/buftag 的预览功能，可以手动用 p 预览
let g:Lf_PreviewResult = {
            \ 'File'        : 0,
            \ 'Buffer'      : 0,
            \ 'Mru'         : 0,
            \ 'Tag'         : 0,
            \ 'BufTag'      : 0,
            \ 'Function'    : 0,
            \ 'Line'        : 0,
            \ 'Colorscheme' : 1
            \}

" Use this option to customize the mappings in normal mode.
let g:Lf_NormalMap = {
            \ "File"     : [  [ "<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'     ]  ] ,
            \ "Buffer"   : [  [ "<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'      ]  ] ,
            \ "Mru"      : [  [ "<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>'      ]  ] ,
            \ "Tag"      : [  [ "<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>'      ]  ] ,
            \ "BufTag"   : [  [ "<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<CR>'   ]  ] ,
            \ "Function" : [  [ "<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>' ]  ] ,
            \ "Line"     : [  [ "<ESC>", ':exec g:Lf_py "lineExplManager.quit()"<CR>'     ]  ] ,
            \ "History"  : [  [ "<ESC>", ':exec g:Lf_py "historyExplManager.quit()"<CR>'  ]  ] ,
            \}


"----------------------------------------------------------------------
" LeaderF key mapping <leader><leader> + [u, p, t, b, m]
"----------------------------------------------------------------------

" f 打開檔案列表
noremap <leader><leader>f :Leaderf --stayOpen --bottom --nameOnly file<CR>
noremap <C-p> :Leaderf --bottom --nameOnly file<CR>

" u 打开最近使用的文件 MRU，进行模糊匹配
noremap <leader><leader>u :Leaderf --bottom --fuzzy mru<CR>
noremap <leader><leader>u! :Leaderf --stayOpen --bottom --fuzzy mru<CR>

" n 打开函数列表，按 i 进入模糊匹配，ESC 退出
noremap <leader><leader>n :Leaderf --left function<CR>
noremap <leader><leader>n! :Leaderf --stayOpen --left function<CR>

" t 打开 tag 列表，i 进入模糊匹配，ESC退出
noremap <leader><leader>t :Leaderf --left bufTag<CR>
noremap <leader><leader>t! :Leaderf --stayOpen --left bufTag<CR>

" b 打开 buffer 列表进行模糊匹配
noremap <leader><leader>b :Leaderf --bottom --nameOnly buffer<CR>
noremap <leader><leader>b! :Leaderf --stayOpen --bottom --nameOnly buffer<CR>

" 全局 tags 模糊匹配
noremap <leader><leader>m :Leaderf --bottom --regex tag<CR>
noremap <leader><leader>m! :Leaderf --stayOpen --bottom --regex tag<CR>

" switch between colorschemes
noremap <leader><leader>r :Leaderf --bottom --nameOnly colorscheme<CR>
noremap <leader><leader>r! :Leaderf --stayOpen --bottom --nameOnly colorscheme<CR>

" search a line in the buffer
noremap <leader><leader>/ :Leaderf --bottom --fuzzy line<CR>
noremap <leader><leader>/! :Leaderf --stayOpen --bottom --fuzzy line<CR>

