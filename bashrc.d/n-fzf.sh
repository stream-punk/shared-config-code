if command -v fzf > /dev/null; then
    FZF_DEFAULT_OPTS="--tiebreak=index"
    bind -x '"\C-r": READLINE_LINE=`cat $HOME/.my_history $HOME/.bash_history | fzf --tac --tiebreak=index`; READLINE_POINT=32768'
fi
