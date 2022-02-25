define-command -docstring "git blame with full movement options -w -C -M" git-move-blame %{ git blame -w -C -M }
define-command -docstring "toggle soft wrap" toggle-soft-wrap %{ try %{
    add-highlighter global/softwrap wrap -word -indent -marker "…       "
    echo "soft wrap: on"
} catch %{
    remove-highlighter global/softwrap
    echo "soft wrap: off"
}}
define-command -docstring "toggle line numbers" toggle-line-numbers %{ try %{
    add-highlighter global/line-numbers number-lines -relative -hlcursor
} catch %{
    remove-highlighter global/line-numbers
}}

