
let g:tagbar_left            = 1
let g:tagbar_autofocus       = 0
let g:tagbar_foldlevel       = 2
let g:tagbar_sort            = 0
let g:tagbar_type_typescript = {
            \ 'ctagstype': 'typescript',
            \ 'kinds': [
            \ 'c:classes',
            \ 'n:modules',
            \ 'f:functions',
            \ 'v:variables',
            \ 'v:varlambdas',
            \ 'm:members',
            \ 'i:interfaces',
            \ 'e:enums',
            \ ]
            \ }

let g:tagbar_type_c = {
            \ 'kinds' : [
            \ 'f:functions:0:1',
            \ 'd:macros:1:1',
            \ 'e:enumerators:1:0',
            \ 'g:enumeration:1:1',
            \ 'l:local:1:1',
            \ 'm:members:1:1',
            \ 'n:namespaces:1:1',
            \ 'p:functions_prototypes:1:1',
            \ 's:structs:1:1',
            \ 't:typedefs:1:1',
            \ 'u:unions:1:1',
            \ 'v:global:1:1',
            \ 'x:external:1:1'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \ 'g' : 'enum',
            \ 'n' : 'namespace',
            \ 'c' : 'class',
            \ 's' : 'struct',
            \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
            \ 'enum'      : 'g',
            \ 'namespace' : 'n',
            \ 'class'     : 'c',
            \ 'struct'    : 's',
            \ 'union'     : 'u'
            \ }
            \ }

nmap t :TagbarToggle<CR>

