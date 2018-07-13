

" 自动打开 quickfix window ，高度为 10
let g:asyncrun_open = 10

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" ripgrep search command support
if executable('rg')
    " search only c type file and display context 3 lines before and after.
    nnoremap <leader>rg :AsyncRun rg -C 3 --vimgrep --smart-case --type c <C-R>=expand("<cword>")<CR>

    " search only mismatch c type file and display context 3 lines before and after.
    nnoremap <leader>rgu :AsyncRun rg -C 3 --vimgrep --smart-case --type-not c <C-R>=expand("<cword>")<CR>
endif

" siliver search command support
if executable('ag')
    nnoremap <leader>ag :AsyncRun ag --vimgrep --smart-case <C-R>=expand("<cword>")<CR>
endif


"----------------------------------------------------------------------
" Dynamic update the AsyncRun start status to airline error section
"----------------------------------------------------------------------
function! AsyncRun_Start_Update_Airline()
    let g:airline_section_temp = g:airline_section_error
    let g:airline_section_error = airline#section#create_right([
                \ '[AsyncRun]:%{g:asyncrun_status}',
                \ g:airline_section_temp,
                \ ])
endfunc
autocmd User AsyncRunStart  call AsyncRun_Start_Update_Airline()

"----------------------------------------------------------------------
" Dynamic update the AsyncRun stop status to airline error section
"----------------------------------------------------------------------
function! AsyncRun_Stop_Update_Airline()
    let g:airline_section_error = airline#section#create_right([
                \ g:airline_section_temp
                \ ])
endfunc
autocmd User AsyncRunStop   call AsyncRun_Stop_Update_Airline()

