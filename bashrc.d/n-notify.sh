__ndas_before__=0
__ndas_duration__=0

__ndas_post__() {
    __ndas_duration__=$(( SECONDS - __ndas_before__ ))
    if (( __ndas_duration__ > 15 )); then
        notify -message "$(history 1 | cut -c 8-)"
    fi
    __ndas_before__=$SECONDS
}

__ndas_post__
PROMPT_COMMAND="__ndas_post__; $PROMPT_COMMAND"
