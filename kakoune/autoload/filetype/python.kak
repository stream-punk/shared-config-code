hook global WinSetOption filetype=python %{
    set-option window autowrap_column 88
    set-option window formatcmd 'black -q - | isort -'
    hook window BufWritePre '.*' format
    my-lsp-init
    lsp-auto-hover-enable
    lsp-inlay-diagnostics-enable window
}
