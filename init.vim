"======================================================================
"
" init.vim - initialize config
"
" Created by titan on 2018/07/13
" Last Modified: 2018/07/13 09:57:34
"
"======================================================================

"----------------------------------------------------------------------
" These global variables are used for personal customization."
" ---------------------------------------------------------------------
" g:t_vim_leader
" g:t_vim_localleader
" g:t_vim_bundle_home
" g:t_vim_bundle_group
" g:t_vim_colorscheme
" g:t_vim_airline_theme

" get the absolute path of t_vim_root
let g:t_vim_root = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.g:t_vim_root.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.g:t_vim_root

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=$HOME/.vim/


"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 加载基础配置
LoadScript init/init-function.vim

" 加载基础配置
LoadScript init/init-basic.vim

" 加载扩展配置
LoadScript init/init-config.vim

" 插件加载
LoadScript init/init-plugins.vim

" 自定义按键
LoadScript init/init-keymaps.vim

" 界面样式
LoadScript init/init-style.vim

" 插件設定
LoadScript init/init-plugsconf.vim

