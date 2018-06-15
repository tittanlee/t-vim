
" 计算当前 vim-init 的子路径 {

    let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

    function! s:path(path)
        let path = expand(s:home . '/' . a:path )
        return substitute(path, '\\', '/', 'g')
    endfunc

    function! s:source_plugsconf(vimscript)
        let plugin_path = expand(s:home . '/' . a:vimscript )
        execute 'source' . substitute(plugin_path, '\\', '/', 'g')
    endfunc

" }

" Airline plugin setting {
    if isdirectory(expand(VimBundleDir('vim-airline'))) " {
        source_plugsconf('vim-airline.vim')
    endif " }
" }

" vim-devicons plugin setting {
    if isdirectory(expand(VimBundleDir('vim-devicons'))) " {
        source_plugsconf('vim-devicons.vim')
    endif " }
" }

" vim-minimap plugin setting {
    if isdirectory(expand(VimBundleDir('vim-minimap'))) " {
        source_plugsconf('vim-minimap.vim')
    endif " }
" }

" syntastic plugin setting {
    if isdirectory(expand(VimBundleDir('syntastic'))) " {
        source_plugsconf('syntastic.vim')
    endif " }
" }

" ale plugin setting {
    if isdirectory(expand(VimBundleDir('ale'))) " {
        source_plugsconf('ale.vim')
    endif " }
" }

" NERDTree plugin setting {
    if isdirectory(expand(VimBundleDir('nerdtree'))) " {
        source_plugsconf('nerdtree.vim')
    endif " }
" }

" TagBar plugin setting {
    if isdirectory(expand(VimBundleDir('tagbar'))) " {
        source_plugsconf('tagbar.vim')
    endif " }
" }

" NERD_Commenter plugin setting {
    if isdirectory(expand(VimBundleDir('nerdcommenter'))) " {
        source_plugsconf('nerdcommenter.vim')
    endif " }
" }

" Vim-Copy-FileName plugin setting {
    if isdirectory(expand(VimBundleDir('vim-copy-filename'))) " {
        source_plugsconf('vim-copy_filename.vim')
    endif " }
" }

" quickr_cscope plugin setting {
    if isdirectory(expand(VimBundleDir('quickr-cscope.vim'))) " {
        source_plugsconf('quickr-cscope.vim')
    endif " }
" }

" FZF plugin setting {
    if isdirectory(expand(VimBundleDir('fzf.vim'))) " {
        source_plugsconf('fzf.vim')
    endif " }
" }

" YouCompleteMe plugin setting {
    if isdirectory(expand(VimBundleDir('youcompleteme'))) " {
        source_plugsconf('youcompleteme.vim')
    endif
" }

" ultisnips plugin setting {
    if isdirectory(expand(VimBundleDir('ultisnips'))) " {
        source_plugsconf('ultisnips.vim')
    endif
" }

" ctrlp plugin setting {
    if isdirectory(expand(VimBundleDir('ctrlp'))) " {
        source_plugsconf('ctrlp.vim')
    endif
" }

" echodoc plugin setting {
    if isdirectory(expand(VimBundleDir('echodoc'))) " {
        source_plugsconf('echodoc.vim')
    endif
" }

" errormaker plugin setting {
    if isdirectory(expand(VimBundleDir('errormaker'))) " {
        source_plugsconf('errormaker.vim')
    endif
" }

