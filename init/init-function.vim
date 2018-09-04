"======================================================================
"
" init-function.vim
"
" Created by titan on 2018/07/13
" Last Modified: 2018/07/13 09:57:34
"
"======================================================================

" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction

        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction

        silent function! BSD()
            return system('uname -s') =~ "BSD"
        endfunction

        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction

        silent function! WSL()
            return LINUX() && system('uname -r') =~ 'Microsoft'
        endfunction

        silent function! CROS()
            return LINUX() && (system('cat /proc/version') =~ 'chrome-bot')
        endfunction

        silent function! ANDROID()
            return isdirectory(expand('/system/priv-app'))
        endfunction

        silent function! KERNELVERSION()
            return substitute(system('uname -r'), '[\n]\+', '', 'g')
        endfunction

        silent function! DISTRO()
            return substitute(system('lsb_release -si'), '[\n]\+', '', 'g')
        endfunction

        silent function! DISTROVERSION()
            return executable('dpkg') ? substitute(system('lsb_release -sd'), '[\n|\"]\+', '', 'g'):
                    \ CROS() ? substitute(system('lsb_release -sir'), '[\n|\"]\+', '', 'g') :
                    \ substitute(system('lsb_release -sdr'), '[\n|\"]\+', '', 'g')
        endfunction

        silent function! BSDDistro()
            return substitute(system('uname -s'), '[\n]\+', '', 'g')
        endfunction

        silent function! OSXVERSION()
            return substitute(system("echo $(sw_vers -productVersion)"), '[\n]\+', '', '')
        endfunction

        silent function! NTVERSION()
            return substitute(system('ver'), '[^0-9|\.]\+', '', 'g')
        endfunction

        silent function! WINVERSION()
            let ntversion = NTVERSION()
            return ntversion =~ "4.10" ? "Windows 98" :
                        \ ntversion =~ "5.0" ? "Windows 2000" :
                        \ ntversion =~ "5.1" ? "Windows XP" :
                        \ ntversion =~ "5.2" ? "Windows XP x64" :
                        \ ntversion =~ "6.0" ? "Windows Vista" :
                        \ ntversion =~ "6.1" ? "Windows 7" :
                        \ ntversion =~ "6.2" ? "Windows 8" :
                        \ ntversion =~ "6.3" ? "Windows 8.1" :
                        \ ntversion =~ "10.0" ? "Windows 10" :
                        \ "Windows (version unknown)"
        endfunction

        silent function! NVIM()
            return has('nvim')
        endfunction

        silent function! GVIM()
            return has('gui_running')
        endfunction

        silent function! NVIMQT()
            return exists('g:GuiLoaded')
        endfunction

        silent function! NVIMGTK()
            return exists('g:GtkGuiLoaded')
        endfunction

        silent function! GONVIM()
            return exists('g:gonvim_running')
        endfunction

        silent function! ONI()
            return exists('g:gui_oni')
        endfunction

        silent function! VIMR()
            return has('gui_vimr')
        endfunction

        silent function! TERMUX()
            return isdirectory(expand('/data/data/com.termux')) " #FIXME: Dirty judge
        endfunction

        silent function! REMOTE()
            return NVIM() && (v:servername =~ "127.0.0.1" || v:servername =~ "0.0.0.0" || v:servername =~ "localhost")
        endfunction
    " }
" }

" T-Vim update function {
    function! T_VimFullUpgrade()
        copen
        cexpr "Running Full Upgrade ...\n".
                    \ "This will take about 2-5 minutes, depending on your network condition.\n" .
                    \ "After finish updating, you can try:\n".
                    \ "    - press `D` to see the changes for plugins.\n" .
                    \ "A restart is **required** after the updating process is finished.\n" . "Enjoy!"
        sleep 1000m

        if WINDOWS()
            execute '!git -C ' .g:t_vim_root. ' pull'
        else
            execute '!git -C ' .g:t_vim_root. ' pull'
        endif
        execute "source ~/.vimrc"

        execute 'PlugUpgrade'
        execute 'PlugClean!'
        execute 'PlugUpdate'
        echo 'Update Completed!'

    endfunction
" }

" Strip WhiteSpace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
" }

" Vim Bundle Directory function {
    if !exists('g:t_vim_bundle_home')
        let g:t_vim_bundle_home = '~/.vim/bundles'
    endif

    function! VimBundleDir(bundlename)
        let bundle_path = expand(g:t_vim_bundle_home . '/' . a:bundlename )
        return substitute(bundle_path, '\\', '/', 'g')
    endfunction
" }


" Search and Replace function {
    " 替换函数。参数说明：
    " confirm：是否替换前逐一确认
    " wholeword：是否整词匹配
    " replace：被替换字符串
    function! Replace(confirm, wholeword, replace)
        wa
        let flag = ''
        if a:confirm
            let flag .= 'gec'
        else
            let flag .= 'ge'
        endif
        let search = ''
        if a:wholeword
            let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
        else
            let search .= expand('<cword>')
        endif
        let replace = escape(a:replace, '/\&~')
        execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
    endfunction
    " 不确认、非整词
    nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
    " 不确认、整词
    nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
    " 确认、非整词
    nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
    " 确认、整词
    nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
    nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" }

" Check if NERDTree is open {
    function! IsNerdTreeEnabled()
        return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
    endfunction
" }

" Check if Tagbar is open {
    function! IsTagbarEnabled()
        return exists('t:tagbar_buf_name') && bufwinnr(t:tagbar_buf_name) != -1
    endfunction
" }

" Check if Tagbat and NERDTree is open {
    
    function! IsTagbarOrNerdTreeOpen()
        if IsNerdTreeEnabled() || IsTagbarEnabled()
            return 1
        else
            return 0
        endif
    endfunction
    
" }

" Check if Tagbat and NERDTree is open {
    function! QFixToggle(forced)
        if exists("g:qfix_win") && a:forced != 0
            cclose
        else
            if exists("g:t_vim_quickfix_win_height")
                execute "copen ".g:t_vim_quickfix_win_height
            else
                copen
            endif
        endif
    endfunction

    augroup QFixToggle
        autocmd!
        autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
        autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
    augroup END
" }
