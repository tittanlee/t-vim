
" Configuration on Neo GuiVim with QT {{{
    if exists('g:GuiLoaded')
        " Starts in fullscreen, Maximized should work too (untested)
        exec 'call GuiWindowMaximized(1)'

        exe 'Guifont! Hack Nerd Font:h12'

        GuiTabline 0
        GuiPopupmenu 0
    endif
"}}}


" Configuration on GVim {{{
"
"set guioptions=
    if has('gui_running')

        "Include Toolbar
        set guioptions-=T

        " Add tab pages when indicated with 'showtabline'.
        set guioptions-=e

        " Menu bar
        set guioptions-=m

        " Right-hand scrollbar 
        set guioptions-=r
        set guioptions-=R

        " Left-hand scrollbar
        set guioptions-=l
        set guioptions-=L

        if has("gui_macvim")
            set guifont=HackNerdFontComplete-Regular:h12
        elseif
            set guifont=Hack_NF:h12
            autocmd GUIEnter * simalt ~x
            simalt ~x
        endif

    endif
" }}}
