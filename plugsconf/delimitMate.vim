
" If this option is set to 0, delimitMate will not add a closing delimiter automagically
" let delimitMate_autoclose = 0

" If this option is set to 1, delimitMate will load, but will not take
" effect in any buffer unless |:DelimitMateSwitch| is called in that
" buffer.
let delimitMate_offByDefault = 1

" If this option is set to 0, delimitMate will not add a closing delimiter automagically.
let delimitMate_autoclose = 0

" Switches the plug-in on and off.
" nnoremap <leader>( :DelimitMateSwitch

" Enable delimitMate mappings.
nnoremap <leader>( :DelimitMateOn <CR>

" Disable delimitMate mappings.
nnoremap <leader>) :DelimitMateOff <CR>
