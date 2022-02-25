if [ -z "$CLESS_FILE"]; then
    export CLESS_FILE="/var/folders/1p/nxx860cs4yn9_gc7g1j_2y_00000gn/T/tmp.jXUjYYL2"
    if ! [ -f "$CLESS_FILE" ]; then
        mkdir -p /var/folders/1p/nxx860cs4yn9_gc7g1j_2y_00000gn/T/
        touch $CLESS_FILE
    fi
fi
