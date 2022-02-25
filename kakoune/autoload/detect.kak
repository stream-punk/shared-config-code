define-command -hidden grep-detection %{ evaluate-commands %sh{
    if [ -z "${kak_opt_filetype}" ]; then
        pattern=$(grep '#!/' "${kak_buffile}")
        case "${pattern}" in
            \#!/*/dash) filetype="sh" ;;
            *) exit ;;
        esac
        if [ -n "${filetype}" ]; then
            printf "set-option buffer filetype '%s'\n" "${filetype}"
        fi
    fi
} }

hook global BufOpenFile .* grep-detection
hook global BufWritePost .* grep-detection
