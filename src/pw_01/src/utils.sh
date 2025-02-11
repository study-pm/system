#!/bin/bash

DIR_PATH="$(dirname "$0")"

source $DIR_PATH/CONS.sh

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
