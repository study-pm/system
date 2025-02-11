#!/bin/bash

DIR_PATH="$(dirname "$0")"

function validateRealNumber {
    if ! [[ $1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: Invalid argument '$1$ (must be a real number)"
        exit 1;
    fi
}
function cos {
    local PI=3.14159265
    awk -v angle="$1" -v PI=$PI '
    BEGIN {
        result = cos(angle * PI / 180.0);
        printf "%f\n", result
    }'
}
