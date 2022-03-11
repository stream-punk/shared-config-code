provide-module language-server %{
    eval %sh{ kak-lsp --kakoune -s $kak_session }
    set-option global lsp_show_hover_format 'printf ''%s\n\n%s'' "${lsp_diagnostics}" "${lsp_info}" | tee $CLESS_FILE | markwarp'

    define-command -hidden lsp-toggle-inlay-on %{
        trigger-user-hook enable-inlay
        map window normal <esc> ':lsp-toggle-inlay-off<ret>'
    }
    define-command -hidden lsp-toggle-inlay-off %{
        trigger-user-hook disable-inlay
        map window normal <esc> ':lsp-toggle-inlay-on<ret>'
    }

    define-command -hidden my-lsp-init -docstring "Initialize lsp functionality" %{
        lsp-enable-window
        lsp-auto-signature-help-enable
        lsp-auto-hover-enable
        map window insert <C-p> '<esc>:lsp-snippets-select-next-placeholders<ret>c'
        lsp-toggle-inlay-off
        hook -group my-inlay-diag window User enable-inlay %{
            add-highlighter "window/lsp_diagnostics" replace-ranges lsp_diagnostics
        }
        hook -group my-inlay-diag window User disable-inlay %{
            remove-highlighter "window/lsp_diagnostics"
        }
        hook -once -always window WinSetOption filetype=.* %{
            remove-hooks window rust-inlay-hints
        }
    }

    define-command -docstring "debug kak-lsp" lsp-debug %{
        nop %sh{ killall kak-lsp; (kak-lsp -s $kak_session -vvv ) > /tmp/kak-lsp.log 2>&1 < /dev/null & }
        edit -scroll /tmp/kak-lsp.log
        buffer-previous
    }

    define-command -docstring "enable language-server format" lsp-enable-format %{
        hook -group lsp-format window BufWritePre '.*' lsp-formatting-sync
    }

    define-command -docstring "disable language-server format" lsp-disable-format %{
        remove-hooks window lsp-format
    }

    define-command -hidden -docstring "show complete hover" lsp-show-complete-hover-done %{
        remove-hooks window lsp-complete-hover
        info -markup -style modal
    }

    define-command -docstring "show complete hover" lsp-show-complete-hover %{
        info -markup -style modal %sh{ cat $CLESS_FILE  | sed '/./,$!d' }
        hook -group lsp-complete-hover window RawKey [^<ret>äÄ] lsp-show-complete-hover-done
    }
}
