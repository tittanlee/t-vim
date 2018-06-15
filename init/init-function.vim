
" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction

        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction

        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

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
"
    if !exists('g:bundle_home')
        let g:bundle_home = '~/.vim/bundles'
    endif

    function! VimBundleDir(bundlename)
        let bundle_path = expand(g:bundle_home . '/' . a:path )
        return substitute(bundle_path, '\\', '/', 'g')
    endfunction

" }

