#!/bin/bash

# CD aliases
# Author: Robert Z. J. Norris-Karr (https://github.com/rzjnzk)

# ---------
# functions
# ---------

# none

# -------------
# main function
# -------------

function func_main
{
    case "$1"
    in
        "dev")
            cd "${DIR_PREFIX_DEV}"
            ;;
        "wdc")
            cd "${DIR_PREFIX_DEV}/a1731824/2019/s1/wdc/"
            ;;
        "adds")
            cd "${DIR_PREFIX_DEV}/a1731824/2019/s1/adds/"
            ;;
    esac
}

# -----------------
# initialise script
# -----------------

script_name="$(basename "${BASH_SOURCE[0]}")"
absolute_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#cd "${absolute_path}"
func_main "$@"
