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

function printFormat {
    local msg=$1
    local isN=false

    # Check if the first argument is "-n"
    if [ "$msg" = "-n" ]; then
        isN=true       # Disable newline
        shift          # Remove "-n" from arguments
        msg=$1         # Update msg to the next argument
    fi

    # Build the format string
    shift
    local format="\e[$1"
    while [ -n "$2" ]
    do
        format+=";$2"
        shift
    done

    local res="${format}m$msg\e[${RESET}m"

    # Print the formatted message
    if $isN; then
        echo -e -n $res # alternative: printf $res
    else
        echo -e $res
    fi
}
