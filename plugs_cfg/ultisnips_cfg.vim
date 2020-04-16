
" To use python version 2.x: >
if has('python3')
    let g:UltiSnipsUsePythonVersion = 3
elseif has('python')
    let g:UltiSnipsUsePythonVersion = 2
endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Ctrl><TAB>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir = '~/.vim/snips'
let g:UltiSnipsSnippetDirectories = ['snips']
