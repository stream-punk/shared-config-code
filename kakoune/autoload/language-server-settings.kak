provide-module language-server-settings %{
    require-module language-server
    hook global KakEnd .* lsp-stop
    set-option -add global lsp_server_configuration \
        pylsp.configurationSources=["flake8"] \
        pylsp.plugins.pycodestyle.enabled=false \
        pylsp.plugins.pydocstyle.enabled=false \
        pylsp.plugins.pyls_black.enabled=false \
        pylsp.plugins.pyls_isort.enabled=false \
        pylsp.plugins.flake8.enabled=true \
        pylsp.plugins.pyflakes.enabled=false \
        pylsp.plugins.maccabe.enabled=false \
        pylsp.plugins.pylint.enabled=false \
        pylsp.plugins.preload.enabled=false \
        pylsp.plugins.yapf.enabled=false \
        pylsp.plugins.rope_completion.enabled=false \
        rust.clippy_preference="on"
    set-option global lsp_hover_anchor true
    map -docstring "enter lsp mode" global normal ) ':enter-user-mode lsp<ret>'
    hook global WinSetOption filetype=(c|cpp|php|sh|javascript) %{
        my-lsp-init
    }
}
