let g:quickr_cscope_use_qf_g      = 1
let g:quickr_cscope_keymaps       = 0
let g:quickr_cscope_prompt_length = 1
let g:quickr_cscope_program       = "gtags-cscope"
let g:quickr_cscope_db_file       = "GTAGS"

nmap <C-\>s <plug>(quickr_cscope_symbols)
nmap <C-\>g <plug>(quickr_cscope_global)
nmap <C-\>c <plug>(quickr_cscope_callers)
nmap <C-\>f <plug>(quickr_cscope_files)
nmap <C-\>i <plug>(quickr_cscope_includes)
nmap <C-\>t <plug>(quickr_cscope_text)
nmap <C-\>e <plug>(quickr_cscope_egrep)
nmap <C-\>d <plug>(quickr_cscope_functions)


