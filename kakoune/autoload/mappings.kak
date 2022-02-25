map -docstring "wrap text" global user w '|pwrap $kak_opt_autowrap_column<ret>'
map -docstring "language-server hover" global normal ä ':lsp-hover<ret>'
map -docstring "language-server complete hover" global normal Ä ':lsp-show-complete-hover<ret>'
map -docstring "paste before" global normal <p> <P>
map -docstring "paste after" global normal <P> <p>

map -docstring "next" global insert <Ω> <C-n>
map -docstring "previous" global insert <∑> <C-p>

map -docstring "next" global prompt <Ω> <C-p>
map -docstring "previous" global prompt <∑> <C-n>

map -docstring "next" global menu <Ω> <C-n>
map -docstring "previous" global menu <∑> <C-p>
