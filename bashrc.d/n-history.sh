BASH_HIST="$HOME/.bash_history"
if [ ! -f "$BASH_HIST" ]; then
    echo init >> "$BASH_HIST"
    chmod 600 "$BASH_HIST"
fi

MY_HIST="$HOME/.my_history"
if [ ! -f "$MY_HIST" ]; then
    echo init >> "$MY_HIST";
    chmod 600 "$MY_HIST"
fi

__hdas_last__=$SECONDS
__hdas_delta__=0

__hdas_history__() {
    history -a
    __hdas_delta__=$(( SECONDS - __hdas_last__ ))
    if (( __hdas_delta__ > 60 )); then
        python3 ~/bin/unique_history &
        disown $!
        python3 ~/bin/unique_history bash &
        disown $!
        __hdas_last__=$SECONDS
    fi
}


shopt -s histappend
HISTFILE="$BASH_HIST"
HISTSIZE=4000
HISTFILESIZE=4000

PROMPT_COMMAND="__hdas_history__; $PROMPT_COMMAND"
