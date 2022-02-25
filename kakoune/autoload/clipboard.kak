provide-module clipboard %{
    map global user y -docstring "yank to clipboard" '<a-|>bcopy<ret>'
    map global user P -docstring "paste from clipboard (After)" '<a-!>bpaste<ret>'
    map global user p -docstring "paste from clipboard (Before)" '!bpaste<ret>'
    map global user R -docstring "replace from clipboard" '|bpaste<ret>'
}
