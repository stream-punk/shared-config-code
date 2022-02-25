hook global WinSetOption filetype=rust %{
    my-lsp-init
    set window formatcmd 'rustfmt --edition 2021'
    hook window BufWritePre '.*' format
    lsp-auto-hover-enable

    hook window -group rust-inlay-hints BufReload .* rust-analyzer-inlay-hints
    hook window -group rust-inlay-hints NormalIdle .* rust-analyzer-inlay-hints
    hook -once -always window WinSetOption filetype=.* %{
        remove-hooks window rust-inlay-hints
    }
}

