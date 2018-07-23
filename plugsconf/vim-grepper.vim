let g:grepper               = {}
"
" let g:grepper.tools         = ['rg', 'git', 'ag']
"
" let g:grepper = {
"     \ 'tools': ['rg'],
"     \ 'rg': {
"     \   'grepprg':    'rg --smart-case -H --column --line-number',
"     \   'grepformat': '%f:%l:%c:%m',
"     \ }}

" Highlight found matches.
let g:grepper.highlight = 1

" Use the quickfix list for the matches or the location list otherwise.
let g:grepper.quickfix = 1

" Open the quickfix/location window after the grep tool finished running (and
" there was at least one match).
let g:grepper.open = 1

" When the quickfix/location window opens, switch to it.
let g:grepper.switch = 1

" Automatically jump to the first match.
let g:grepper.jump = 0

" To prompt or not to prompt!
let g:grepper.prompt = 1

" The following values are available:
"   1    Quote the query automatically.
"   2    Populate the prompt with single quotes and put cursor in between.
"   3    Populate the prompt with double quotes and put cursor in between.
" let g:grepper.prompt_quote = 0

" Change working directory before grepping. If the directory changes, Grepper
" won't change back after the search finishes.
let g:grepper.dir = 'cwd'

" Only show the tool name in the prompt, without any of its arguments.
let g:grepper.simple_prompt = 0

" Open a new window and show matches with surrounding context. See |grepper-side|
" for details
let g:grepper.side = 0

" The command used for opening the side window. See |grepper-side| for details.
let g:grepper.side_cmd = 'vnew'

"----------------------------------------------------------------------
" vim-grepper key mapping
"----------------------------------------------------------------------
nnoremap <leader>grg :Grepper -tool rg -cword <CR><CR>
