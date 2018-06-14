
" 忽略默认键位
let g:ctrlp_map = ''

" 模糊匹配忽略
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|mp3|wav|sdf|suo|mht)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

" 项目标志
let g:ctrlp_root_markers = ['.project', '.root', '.svn', '.git']
let g:ctrlp_working_path = 0

" CTRL+p 打开文件模糊匹配
noremap <c-p> :CtrlP<cr>

" CTRL+n 打开最近访问过的文件的匹配
noremap <c-n> :CtrlPMRUFiles<cr>

" ALT+p 显示当前文件的函数列表
noremap <m-p> :CtrlPFunky<cr>

" ALT+n 匹配 buffer
noremap <m-n> :CtrlPBuffer<cr>

