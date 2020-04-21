" Set this to 2 or 3 to specify the version of Python
if has('python')
    let g:Lf_PythonVersion = 2
endif

if has('python3')
    let g:Lf_PythonVersion = 3
endif

" Use this option to set the mapping of searching files command.
let g:Lf_ShortcutF = '<Leader>lf'

" Use this option to set the mapping of searching buffers command.
let g:Lf_ShortcutB = '<Leader>lb'

"Specify the default mode when LeaderF is launched.
"There are 4 modes, and the corresponding values are:
"'NameOnly' - fuzzy mode, match file name only when searching
"'FullPath' - fuzzy mode, match full path when searching
"'Fuzzy' - fuzzy mode, when lines in the result are not file path
"'Regex' - regex mode
let g:Lf_DefaultMode = 'Fuzzy'

" Set this option to change the location of the cache directory.
let g:Lf_CacheDirectory = expand('~/.vim/cache')


" A Dictionary to store separators.
let g:Lf_StlSeparator = { 'left': '', 'right': '' }

"Use this option to specify the default external tool which is used to index the files.
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_UseVersionControlTool = 0
let g:Lf_ExternalCommand = 'rg --files --no-ignore --hidden -g !.git "%s"'

" Set LeaderF's working directory.
let g:Lf_WorkingDirectory =getcwd()

" Specify a list of ripgrep configurations. For example, >
let g:Lf_RgConfig = [
            \ "--glob=!git/*",
            \ "--hidden"
            \ ]

" This option specifies whether to preview the result in a popup window.
let g:Lf_PreviewInPopup = 1

" Setting this option can change the position of the LeaderF window.
" The value can be 'fullScreen', 'top', 'bottom', 'left', 'right'.'fullScreen'
let g:Lf_WindowPosition = 'popup'

let g:Lf_PopupPreviewPosition = 'bottom'

" This is a dictionary, indicates whether to enable the preview of the result.
" Default value is: >
let g:Lf_PreviewResult = {
            \ 'File': 0,
            \ 'Buffer': 0,
            \ 'Mru': 0,
            \ 'Tag': 0,
            \ 'BufTag': 1,
            \ 'Function': 1,
            \ 'Line': 1,
            \ 'Colorscheme': 1,
            \ 'Rg': 1,
            \ 'Gtags': 1
            \}


" LeaderF key mapping <leader>f {{{
nmap <Leader>l  [Leaderf-leaderkey]

nnoremap [Leaderf-leaderkey]f :<C-u>LeaderfFile<CR>
nnoremap [Leaderf-leaderkey]t :<C-u>LeaderfBufTag<CR>
nnoremap [Leaderf-leaderkey]T :<C-u>LeaderfTag<CR>
nnoremap [Leaderf-leaderkey]b :<C-u>LeaderfBufferAll<CR>
nnoremap [Leaderf-leaderkey]rW : :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native'
let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'
noremap [Leaderf-leaderkey]gr :<C-U><C-R>=printf("Leaderf gtags -r %s", expand("<cword>"))<CR><CR>
noremap [Leaderf-leaderkey]gd :<C-U><C-R>=printf("Leaderf gtags -d %s", expand("<cword>"))<CR><CR>
noremap [Leaderf-leaderkey]gs :<C-U><C-R>=printf("Leaderf gtags -s %s", expand("<cword>"))<CR><CR>
noremap [Leaderf-leaderkey]go :<C-U><C-R>=printf("Leaderf gtags --recall %s", "")<CR><CR>
noremap [Leaderf-leaderkey]gn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap [Leaderf-leaderkey]gp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

" }}}
