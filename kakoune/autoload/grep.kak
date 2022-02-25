provide-module grep %{
    declare-option -hidden str default_grep_cmd
    set-option global default_grep_cmd 'ag --column --'
    set-option global grepcmd %opt{default_grep_cmd}
    define-command -docstring "grep using git-grep" -params .. git-grep %{
        set-option global grepcmd 'git grep -n --column --'
        grep %arg{@}
        set-option global grepcmd %opt{default_grep_cmd}
    }
}
