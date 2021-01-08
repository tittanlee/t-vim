" Set this to 2 or 3 to specify the version of Python
if has('python3')
    let g:Lf_PythonVersion = 3
elseif has('python')
    let g:Lf_PythonVersion = 2
endif


" Use this option to set the mapping of searching files command.
let g:Lf_ShortcutF = ''

" Use this option to set the mapping of searching buffers command.
let g:Lf_ShortcutB = ''

" Use this option to customize the mappings inside LeaderF's
let g:Lf_CommandMap = {
            \ '<PageDown>': ['<C-D>'], 
            \ '<PageUp>': ['<C-U>']
            \ }

"Specify the default mode when LeaderF is launched.
"There are 4 modes, and the corresponding values are:
"'NameOnly' - fuzzy mode, match file name only when searching
"'FullPath' - fuzzy mode, match full path when searching
"'Fuzzy' - fuzzy mode, when lines in the result are not file path
"'Regex' - regex mode
let g:Lf_DefaultMode = 'NameOnly'

" Set this option to change the location of the cache directory.
"let g:Lf_CacheDirectory = expand('D:\Tools\vim\vim_8.2.2129\vimfiles\cache')
let g:Lf_CacheDirectory = expand(get(g:, 't_vim_cache', '~/.vim/cache'))

" A Dictionary to store separators.
"let g:Lf_StlSeparator = { 'left': '', 'right': '' }

"Use this option to specify the default external tool which is used to index the files.
let g:Lf_ShowRelativePath = 1
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_UseVersionControlTool = 0
let g:Lf_ExternalCommand = 'rg --files --no-ignore --hidden -g !.git "%s"'
"let g:Lf_ExternalCommand = 'fd --hidden --type file -E .git -E "*.{exe,dll,lib,Lib,pyd,pyc,pyo,so,o}" "%s"'

" Set LeaderF's working directory.
let g:Lf_RootMarkers = []
let g:Lf_WorkingDirectory =getcwd()

" Specify a list of ripgrep configurations. For example, >
let g:Lf_RgConfig = [
            \ "--glob=!git/*",
            \ "--hidden"
            \ ]

" This is a dictionary, indicates whether to enable the preview of the result.
" Default value is: >
let g:Lf_PreviewResult = {
            \ 'File'        : 0,
            \ 'Buffer'      : 0,
            \ 'Mru'         : 0,
            \ 'Tag'         : 0,
            \ 'BufTag'      : 0,
            \ 'Function'    : 0,
            \ 'Line'        : 0,
            \ 'Colorscheme' : 1,
            \ 'Rg'          : 0,
            \ 'Gtags'       : 0
            \}

" This option specifies whether to preview the result in a popup window.
let g:Lf_PreviewCode = 1
let g:Lf_PreviewInPopup = 0
let g:Lf_PreviewHorizontalPosition = 'right'
let g:Lf_PopupPreviewPosition = 'bottom'


" LeaderF key mapping <leader>f {{{
    nmap <Leader>f  [Leaderf-leaderkey]

    nnoremap [Leaderf-leaderkey]vim :<C-u>LeaderfFile <C-R>=expand(g:t_vim_root)<CR><CR>

    nnoremap [Leaderf-leaderkey]f :<C-u>LeaderfFile<CR>
    nnoremap [Leaderf-leaderkey]b :<C-u>LeaderfBuffer<CR>
    nnoremap [Leaderf-leaderkey]/ :<C-u>LeaderfLine<CR>
    nnoremap [Leaderf-leaderkey]c :<C-u>LeaderfColorscheme<CR>
    nnoremap [Leaderf-leaderkey]h :<C-u>LeaderfHelp<CR>
    nnoremap [Leaderf-leaderkey]t :<C-u>LeaderfBufTag<CR>
    nnoremap [Leaderf-leaderkey]T :<C-u>LeaderfTag<CR>

    nnoremap [Leaderf-leaderkey]j :LeaderfTjump <c-r><c-w><cr>

    " Leaderf RG support {{{
        nnoremap [Leaderf-leaderkey]rW :<C-u><C-R>=printf("Leaderf! rg --smart-case -e %s --match-path", expand("<cword>"))<CR>
        nnoremap [Leaderf-leaderkey]re :<C-u>LeaderRgRecall<CR>
    " }}}

    " Leaderf Gtags support {{{
    " should use `Leaderf gtags --update` first
        let g:Lf_GtagsAutoGenerate = 0
        let g:Lf_GtagsGutentags = 1
        let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/.LfCache/gtags')
        let g:Lf_GtagsSource = 1
        let g:Lf_Gtagslabel = 'native'
        if has('win32') || has('win64')
            let g:Lf_Gtagsconf = 'C:/utility_tools/share/gtags/gtags.conf'
        else
            let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'
        endif
        noremap <C-\>d :<C-U><C-R>=printf("Leaderf gtags -d %s --match-path", expand("<cword>"))<CR><CR>
        noremap <C-\>r :<C-U><C-R>=printf("Leaderf gtags -r %s --match-path", expand("<cword>"))<CR><CR>
        noremap <C-\>s :<C-U><C-R>=printf("Leaderf gtags -s %s --match-path", expand("<cword>"))<CR><CR>
        noremap <C-\>g :<C-U><C-R>=printf("Leaderf gtags -g %s --match-path", expand("<cword>"))<CR><CR>
        noremap <C-\> :<C-U><C-R>=printf("Leaderf gtags --recall %s", "")<CR><CR>
    " }}}

" }}}
