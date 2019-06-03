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

_main()
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
	"cs")
	    cd "${DIR_PREFIX_DEV}/a1731824/2019/s1/cs/"
	    ;;
        "winusr")
            cd "/mnt/c/Users/User"
            ;;
    esac
}

_main "$@"

# -----------------
# initialise script
# -----------------


