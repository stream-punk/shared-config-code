provide-module search-highlight %{
    set-face global SearchHighlight default,rgba:83B46D40

    define-command search-highlight-off %{
        remove-highlighter global/hltoggle
    }

    define-command search-highlight-on %{
        add-highlighter window/hltoggle dynregex '%reg{/}' 0:SearchHighlight
    }
}
