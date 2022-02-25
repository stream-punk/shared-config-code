hook global WinSetOption filetype=(c|cpp) %{
    set-option window autowrap_column 88
    set-option window formatcmd 'clang-format --style=WebKit'
    hook window BufWritePre '.*' format
}
