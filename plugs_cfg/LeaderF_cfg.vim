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

"Specify the default mode when LeaderF is launched.
"There are 4 modes, and the corresponding values are:
"'NameOnly' - fuzzy mode, match file name only when searching
"'FullPath' - fuzzy mode, match full path when searching
"'Fuzzy' - fuzzy mode, when lines in the result are not file path
"'Regex' - regex mode
let g:Lf_DefaultMode = 'NameOnly'

" Set this option to change the location of the cache directory.
let g:Lf_CacheDirectory = expand('~/.vim/cache')

" A Dictionary to store separators.
"let g:Lf_StlSeparator = { 'left': '', 'right': '' }

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


" LeaderF key mapping <leader>f {{{
    nmap <Leader>l  [Leaderf-leaderkey]

    nnoremap [Leaderf-leaderkey]vim :<C-u>LeaderfFile <C-R>=expand(g:t_vim_root)<CR><CR>

    nnoremap [Leaderf-leaderkey]f :<C-u>LeaderfFile<CR>
    nnoremap [Leaderf-leaderkey]b :<C-u>LeaderfBuffer<CR>
    nnoremap [Leaderf-leaderkey]/ :<C-u>LeaderfLine<CR>
    nnoremap [Leaderf-leaderkey]c :<C-u>LeaderfColorscheme<CR>
    nnoremap [Leaderf-leaderkey]h :<C-u>LeaderfHelp<CR>
    nnoremap [Leaderf-leaderkey]t :<C-u>LeaderfBufTag<CR>
    nnoremap [Leaderf-leaderkey]T :<C-u>LeaderfTag<CR>

    " Leaderf RG support {{{
        nnoremap [Leaderf-leaderkey]rW :<C-u><C-R>=printf("Leaderf! rg --smart-case -e %s --match-path", expand("<cword>"))<CR>
        nnoremap [Leaderf-leaderkey]re :<C-u>LeaderRgRecall<CR>
    " }}}

    " Leaderf Gtags support {{{
    " should use `Leaderf gtags --update` first
        let g:Lf_GtagsAutoGenerate = 0
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
