#!/bin/sh

# TODO: Accept flag var that has space delimited help flags.
_print_leading_comments()
{
    if
        test "${#}" -gt 0 \
        && test -n "$(printf "%s\n" "${@}" | sed -n "/^--help$/pq; /^-h$/pq")"
    then
        sed -n \
            "
                3,/^$/
                {
                    s/^# //g
                    s/^#//g
                    p
                }
            " \
            "${_script_path}/${_script_name}"

        exit
    fi
}
