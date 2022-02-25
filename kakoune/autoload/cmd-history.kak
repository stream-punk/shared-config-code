provide-module cmd-history %{
    define-command -docstring "save history" history-load %{ try %{ evaluate-commands %sh{ cat "$HOME/.kak_history" | kaktrunchist } } }
    define-command -docstring "load history" history-save %{ echo -to-file %sh{ echo "$HOME/.kak_history" } -quoting kakoune reg : %reg{:} }
    define-command -docstring "execute history command" -params 1 -shell-script-candidates %{
        cat "$HOME/.kak_history" | kakfilterhist
    } execute-history %{
        evaluate-commands %sh{
            echo "$1"
        }
    }
}
