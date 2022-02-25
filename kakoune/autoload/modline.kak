provide-module modeline %{
    declare-option -docstring "name of the aruba window" \
        str modeline_aruba_window

    define-command -hidden modline-load-aruba-window %{
        evaluate-commands %sh{
            window="$(tmux display-message -p '#S [#W]')"
            if [ -n "${window}" ]; then
                printf 'set window modeline_aruba_window %%{%s}' "${window}"
            fi
        }
    }
    hook global WinCreate .* modline-load-aruba-window
    hook global BufWritePost .* modline-load-aruba-window
    set global modelinefmt '%opt{modeline_aruba_window} %val{bufname} %val{cursor_line}:%val{cursor_char_column} {{context_info}} {{mode_info}} - %val{client}@[%val{session}]'
}
