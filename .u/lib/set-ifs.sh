#!/bin/sh

_lib__set_ifs()
{
    if
        test "${1}" = "newline"
    then
        IFS="$(printf "%s" "$(printf "\nx")" | sed "s/^\\(.\\).*/\\1/")"
    fi
}