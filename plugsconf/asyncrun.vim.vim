
let g:asyncrun_open = 10

" ripgrep search command support
if executable('rg')
    nmap <leader>rg :AsyncRun rg --vimgrep --smart-case <C-R>=expand("<cword>")<CR>
endif

" siliver search command support
if executable('ag')
    nmap <leader>ag :AsyncRun ag --vimgrep --smart-case <C-R>=expand("<cword>")<CR>
endif
