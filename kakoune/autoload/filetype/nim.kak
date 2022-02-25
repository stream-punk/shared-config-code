hook global WinSetOption filetype=nim %{
    set window indentwidth 2
    my-lsp-init
    set window formatcmd 'nim-format'
    hook window BufWritePre '.*' format
}

