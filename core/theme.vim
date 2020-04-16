

" seoul256 theme {{{
    if g:t_vim_colorscheme == 'seoul256'
        " seoul256 (dark):
        " Range:   233 (darkest) ~ 239 (lightest)
        " Default: 237
        let g:seoul256_background = 233

        " seoul256 (light):
        " Range:   252 (darkest) ~ 256 (lightest)
        " Default: 253
        " let g:seoul256_background = 256
    endif
" }}}

" sonoka theme {{{
    if g:t_vim_colorscheme == 'sonokai'
        "g:sonokai_style: Customize the style of this color scheme.
        "Available values: 'shusia', 'andromeda', 'atlantis', 'maia'
        let g:sonokai_style = 'andromeda'

        "g:sonokai_transparent_background: Set to 1 to enable transparent background
        let g:sonokai_transparent_background = 0

        "g:sonokai_menu_selection_background: Control the background color of PmenuSel and WildMenu .
        "Available values: 'green', 'red', 'blue'
        let g:sonokai_menu_selection_background = 'green'

        "g:sonokai_disable_italic_comment: Set to 1 to disable italic in Comment
        let g:sonokai_disable_italic_comment = 0

        "g:sonokai_enable_italic: Set to 1 to italicize keywords.
        "This option is designed to use with fonts that support cursive italic styles, for example Fira Code iCursive Op.
        let g:sonokai_enable_italic = 0

        "g:sonokai_cursor: Customize the cursor color, only works in GUI clients.
        "Available values: 'auto', 'red', 'green', 'blue'
        let g:sonokai_cursor = 'red'

        "g:sonokai_current_word: Some plugins can highlight the word under current cursor(for example neoclide/coc-highlight),
        "you can use this option to control their behavior.
        "Available values: 'bold', 'underline', 'italic', 'grey background'
        let g:sonokai_current_word = 'grey background'

        "g:sonokai_lightline_disable_bold: Set to 1 to disable bold in lightline theme
        let g:sonokai_lightline_disable_bold = 0
    endif
" }}}



exec "colorscheme " . g:t_vim_colorscheme
