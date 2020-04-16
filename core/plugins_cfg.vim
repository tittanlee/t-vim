
"
" Desc : Plugig config
" File : plugins_cfg.vim
"


" Load the plugin configuration if the file of plugin configuration name match bundle {
    function! SourcePluginConfiguration()
        for BundlePlug in g:plugs_order
            let PlugConfFullPath = expand(g:t_vim_root . '/plugs_cfg/' . BundlePlug . '_cfg.vim')
            if filereadable(PlugConfFullPath)
                exec 'source ' PlugConfFullPath
            endif
        endfor
    endfunction
" }

call SourcePluginConfiguration()


