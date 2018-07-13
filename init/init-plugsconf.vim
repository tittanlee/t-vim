"======================================================================
"
" init-plugsconf.vim - Vim plugin configuration
"
" Created by titan on 2018/07/13
" Last Modified: 2018/07/13 09:57:34
"
"======================================================================


" Load the plugin configuration if the file of plugin configuration name match bundle
" plugin directory name.
function! SourcePluginConfiguration()
    for BundlePlug in g:plugs_order
        let PlugConfFullPath = expand(g:t_vim_root . '/plugsconf/' . BundlePlug . '.vim')
        if filereadable(PlugConfFullPath)
            exec 'source' PlugConfFullPath
        endif
    endfor
endfunction

call SourcePluginConfiguration()
