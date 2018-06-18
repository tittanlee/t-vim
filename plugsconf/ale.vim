" When set to `0`, this option will completely disable ALE, such that no
" error checking will be performed, etc. ALE can be toggled on and off with
" the |ALEToggle| command, which changes this option
let g:ale_enabled = 0

" 在 linux/mac 下降低语法检查程序的进程优先级（不要卡到前台进程）
if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
    let g:ale_command_wrapper = 'nice -n5'
endif

" Disable realtime linting due to performance issue
let g:ale_lint_on_text_changed = 'normal'
let g:ale_open_list = 1
let g:ale_list_window_size = 8

" By updating loclist. (On by default)
let g:ale_set_loclist = 0

" By updating quickfix. (Off by default)
let g:ale_set_quickfix = 1

let g:ale_fix_on_save = 1

" Check on bufenter
let g:ale_lint_on_enter = 1
let g:ale_set_signs = 1

" 设定延迟和提示信息
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500

" 设定检测的时机：normal 模式文字改变，或者离开 insert模式
" 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

"始终开启标志列
let g:ale_sign_column_always = 1

let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" 允许 airline 集成
let g:airline#extensions#ale#enabled = 1


"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
            \ 'c': ['gcc', 'cppcheck'], 
            \ 'cpp': ['gcc', 'cppcheck'], 
            \ 'python': ['flake8', 'pylint'], 
            \ 'lua': ['luac'], 
            \ 'go': ['go build', 'gofmt'],
            \ 'java': ['javac'],
            \ 'javascript': ['eslint'], 
            \ }



