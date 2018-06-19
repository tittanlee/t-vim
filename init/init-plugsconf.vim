
" Load the plugin configuration if the file of plugin configuration name match bundle
" plugin directory name.
function! SourcePluginConfiguration(dir)
    let BundleList = map(glob(fnameescape(a:dir).'/{,.}*/', 1, 1), 'fnamemodify(v:val, ":h:t")')
    for BundlePlug in BundleList
        let PlugConfFullPath = expand(g:t_vim_root . '/plugsconf/' . BundlePlug . '.vim')
        if filereadable(PlugConfFullPath)
            exec 'source' PlugConfFullPath
        endif
    endfor
endfunction

call SourcePluginConfiguration(g:bundle_home)
