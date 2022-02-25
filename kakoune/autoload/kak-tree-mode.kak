provide-module kak-tree-mode %{
    declare-user-mode kak-tree
    map global normal <c-k> ':tree-select-parent-node<ret>' -docstring 'select parent tree node'
    map global kak-tree <h> ':tree-select-first-child<ret>' -docstring 'select first tree child'
    map global kak-tree <j> ':tree-select-previous-node<ret>' -docstring 'select previous tree node'
    map global kak-tree <k> ':tree-select-parent-node<ret>' -docstring 'select parent tree node'
    map global kak-tree <l> ':tree-select-next-node<ret>' -docstring 'select next tree node'
    map global normal <ö> ':enter-user-mode -lock kak-tree<ret>' -docstring 'enter kak-tree mode'
}
