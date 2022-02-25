provide-module keep-nav-left %{
    map -docstring "search next word" global normal <C-e> <C-s><A-i>w*n9999vh
    map -docstring "select next current search pattern match" global normal n n9999vh
    map -docstring "select previous current search pattern match" global normal <A-n> <A-n>9999vh
    map -docstring "move down" global normal j j9999vh
    map -docstring "move up" global normal k k9999vh
    #map -docstring "move down" global normal <S-j> <S-j>9999vh
    #map -docstring "move up" global normal <S-k> <S-k>9999vh
}
