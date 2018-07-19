
"Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'

"When invoked, unless a starting directory is specified, CtrlP will set its
"local working directory according to this variable:
let g:ctrlp_working_path_mode = 'wra'

" Show dotfiles
let g:ctrlp_show_hidden = 1

let g:ctrlp_max_depth = 80

" Set delay to prevent extra search
let g:ctrlp_lazy_update = 1

" 加大 cache 索引的檔案數, 否則會漏找檔案
let g:ctrlp_max_files = 0
let g:ctrlp_mruf_max=500


"Use a custom file listing command:
let g:ctrlp_user_command = 'ag -i -g "" %s'

let g:ctrlp_match_window = 'buttom,order:ttb,min:1,max:10,results:500'
let g:ctrlp_use_caching = 1

