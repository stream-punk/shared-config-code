map -docstring "wrap text" global user w '|pwrap $kak_opt_autowrap_column<ret>'
map -docstring "language-server hover" global normal ä ':lsp-hover<ret>'
map -docstring "language-server complete hover" global normal Ä ':lsp-show-complete-hover<ret>'
map -docstring "paste before" global normal <p> <P>
map -docstring "paste after" global normal <P> <p>
