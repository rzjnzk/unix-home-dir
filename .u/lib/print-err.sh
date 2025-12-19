#!/bin/sh

_lib__print_err()
{
    (
        tput setaf 1 2> /dev/null

        printf "%s\n" "Error: ${1}" 1>&2

        shift

        if
            test -n "${1}"
        then
            printf "%s\n" "${@}" 1>&2
        fi

        tput sgr0 2> /dev/null
    )
}
