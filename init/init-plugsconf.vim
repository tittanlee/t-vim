
" Load the plugin configuration if the file of plugin configuration name match bundle
" plugin directory name.
function! SourcePluginConfiguration(dir)
    for BundlePlug in g:plugs_order
        let PlugConfFullPath = expand(g:t_vim_root . '/plugsconf/' . BundlePlug . '.vim')
        if filereadable(PlugConfFullPath)
            exec 'source' PlugConfFullPath
        endif
    endfor
endfunction

call SourcePluginConfiguration(g:t_vim_bundle_home)
