hook global WinSetOption filetype=rust %{
    my-lsp-init
    set window formatcmd 'rustfmt --edition 2021'
    hook window BufWritePre '.*' format
    hook -group rust-inlay-hints window User enable-inlay %{
        rust-analyzer-inlay-hints
    }
    hook -group rust-inlay-hints window User disable-inlay %{
        unset-option buffer rust_analyzer_inlay_hints
    }
    hook -once -always window WinSetOption filetype=.* %{
        remove-hooks window rust-inlay-hints
    }
    set-face global InlayHint rgb:5E6267
    rust-analyzer-inlay-hints
}
