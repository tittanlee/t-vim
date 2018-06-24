
let g:asyncrun_open = 10

" ripgrep search command support
if executable('rg')
    " search only c type file and display context 3 lines before and after.
    nmap <leader>rg :AsyncRun rg -C 3 --vimgrep --smart-case --type c <C-R>=expand("<cword>")<CR>

    " search only mismatch c type file and display context 3 lines before and after.
    nmap <leader>rgu :AsyncRun rg -C 3 --vimgrep --smart-case --type-not c <C-R>=expand("<cword>")<CR>
endif

" siliver search command support
if executable('ag')
    nmap <leader>ag :AsyncRun ag --vimgrep --smart-case <C-R>=expand("<cword>")<CR>
endif
