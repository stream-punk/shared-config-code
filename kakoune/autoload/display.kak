set-option global autoreload yes
set-option global tabstop 4
set-option global ui_options terminal_enable_mouse=false
define-command -docstring "enable all autoinof" show-all-autoinfo-enable %{
    set-option global autoinfo command|onkey|normal
}
define-command -docstring "disable all autoinof" show-all-autoinfo-disable %{
    set-option global autoinfo command|onkey
}

add-highlighter global/line-numbers number-lines -hlcursor
add-highlighter global/ show-matching
