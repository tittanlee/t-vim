" coc environmet setting.
let g:coc_config_home = g:t_vim_root

" Error character used for statusline, default: `

" Warning character used for statusline, default: `W`


call coc#add_extension(
            \'coc-json',
            \'coc-tsserver',
            \'coc-clangd',
            \'coc-git',
            \'coc-lists',
            \'coc-yank',
            \'coc-marketplace',
            \'coc-syntax',
            \'coc-gitignore',
            \'coc-highlight',
            \'coc-snippets',
            \'coc-dictionary',
            \'coc-zi',
            \'coc-translator',
            \'coc-vimlsp',
            \'coc-smartf',
            \)
            "\'coc-ultisnips',
            "\'coc-explorer',
            "\'coc-actions',
            "\'coc-prettier',
            "\'coc-post',
            "\'coc-imselect',
            "\'coc-eslint',
            "\'coc-emoji',
            "\'coc-emmet',
            "\'coc-yaml',
            "\'coc-diagnostics',
            "\'coc-spell-checker',

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" nmap <silent> <leader>cj <Plug>(coc-definition)
" nmap <silent> <leader>cc <Plug>(coc-declaration)
" nmap <silent> <leader>cr <Plug>(coc-references)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)

" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Mappings using CoCList: {{{
    " coc.nvim leader key {{{
        nmap <Leader>o [coc-leaderkey]
    " }}}

    " CocList generic command {{{

        " Show all buffers.
        nnoremap <silent> [coc-leaderkey]b  :<C-u>CocList buffers<cr>

        " Fuzzy search files
        nnoremap <silent> [coc-leaderkey]f  :<C-u>CocList files<cr>

        " Show all diagnostics.
        nnoremap <silent> [coc-leaderkey]d  :<C-u>CocList diagnostics<cr>

        " Find symbol of current document.
        nnoremap <silent> [coc-leaderkey]o  :<C-u>CocList outline<cr>

        " Search workspace symbols.
        nnoremap <silent> [coc-leaderkey]s  :<C-u>CocList -I symbols<cr>

        " Resume latest coc list.
        nnoremap <silent> [coc-leaderkey]r  :<C-u>CocListResume<CR>

        " Yanks history
        nnoremap <silent> [coc-leaderkey]y  :<C-u>CocList yank<CR>

        " Search buffer lines
        nnoremap <silent> [coc-leaderkey]/  :<C-u>CocList lines<cr>
    " }}}

    " Use K to show documentation in preview window.
    nnoremap <silent> [coc-leaderkey]K :call <SID>show_documentation()<CR>

    " Trigger completion.
    inoremap <silent><expr> <C-a> coc#refresh()

    " Do default action for next item.
    "nnoremap <silent> [coc-leaderkey]j  :<C-u>CocNext<CR>

    " Do default action for previous item.
    "nnoremap <silent> [coc-leaderkey]k  :<C-u>CocPrev<CR>

" }}}
