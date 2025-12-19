#!/bin/sh
#
# NAME
#     uuidgen -

set -e

if
    command -v uuidgen > /dev/null 2>&1
then
    uuidgen "${@}"
else
    printf "%s\n" "Error: \`uuidgen\` command not found." >&2
    exit 1
fi

# cat /proc/sys/kernel/random/uuid
# curl -s https://www.uuidgenerator.net/api/version4
# curl -s https://httpbin.org/uuid | sed -n 's/.*"uuid": *"\([^"]*\)".*/\1/p'