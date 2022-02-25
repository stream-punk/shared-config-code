provide-module spell-patch %{
    define-command \
        -docstring "Suggest replacement words for the current selection, against the last language used by the spell-check command" \
        spell-suggest %{
        prompt \
            -shell-script-candidates %{
                options=""
                if [ -n "$kak_opt_spell_last_lang" ]; then
                    options="-l '$kak_opt_spell_last_lang'"
                fi
                printf %s "$kak_selection" |
                    eval "aspell -a $options" |
                    gsed -n -e '/^&/ { s/^[^:]*: //; s/, /\n/g; p }'
            } \
            "Replace with: " \
            %{
                evaluate-commands -save-regs a %{
                    set-register a %val{text}
                    execute-keys c <c-r>a <esc>
                }
            }
    }
}
