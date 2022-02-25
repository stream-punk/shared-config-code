provide-module spell-completion %{
    define-command -docstring "close spelling-file" -params 1 -shell-script-candidates %{
        for b in ${kak_buflist}; do
            if expr "$b" : '\*s:.*\*' > /dev/null; then
                echo $b | sed 's/^\*s:\(.*\).*\*/\1/'
            fi
        done
    } spell-comp-close-file %{
        evaluate-commands %sh{
            echo buffer "*s:$1*"
            echo delete-buffer!
        }
    }
    define-command -docstring "close all dictionaries" spell-comp-close %{
        evaluate-commands %sh{
            for b in ${kak_buflist}; do
                if expr "$b" : '\*s:.*\*' > /dev/null; then
                    echo spell-comp-close-file $(echo $b | sed 's/^\*s:\(.*\).*\*/\1/')
                fi
            done
        }
    }
    define-command -docstring "load a spelling-file for completion" -params 1 spell-comp-open-file %{
        evaluate-commands %sh{
            if ! expr "${kak_buflist}" : ".*$1.*" > /dev/null; then
                cur_buf="${kak_bufname}"
                    echo edit "*s:$1*"
                echo execute-keys "!gzcat\ '$HOME/.config/kak/$1.gz'<ret>"
                echo set-option buffer readonly true
                if [ -z "$cur_buf" ]; then
                    exit 0
                fi
                echo buffer "$cur_buf"
            fi
        }
    }
}
