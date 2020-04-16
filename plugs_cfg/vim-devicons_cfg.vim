

" Extra Configuration {
    " loading the plugin
    let g:webdevicons_enable = 1

    " adding to vim-startify screen
    let g:webdevicons_enable_startify = 1

    " adding to flagship's statusline
    let g:webdevicons_enable_flagship_statusline = 1

    " turn on/off file node glyph decorations (not particularly useful)
    let g:WebDevIconsUnicodeDecorateFileNodes = 1

    " use double-width(1) or single-width(0) glyphs
    " only manipulates padding, has no effect on terminal or set(guifont) font
    let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" }

" Character Mappings {
    " change the default character when no match found
    let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'

    " set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
    " disabled by default with no value
    let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''

    " enable folder/directory glyph flag (disabled by default with 0)
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1

    " enable open and close folder/directory glyph flags (disabled by default with 0)
    let g:DevIconsEnableFoldersOpenClose = 1

    " enable pattern matching glyphs on folder/directory (enabled by default with 1)
    let g:DevIconsEnableFolderPatternMatching = 1

    " enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
    let g:DevIconsEnableFolderExtensionPatternMatching = 1

    " enable custom folder/directory glyph exact matching
    " (enabled by default when g:WebDevIconsUnicodeDecorateFolderNodes is set to 1)
    let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
" }
