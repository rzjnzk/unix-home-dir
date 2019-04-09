#!/bin/bash

# Test script
# Author: Robert Z. J. Norris-Karr (https://github.com/rzjnzk)

# ---------
# functions
# ---------

function func_down
{
    echo "Entering \"${DIR_PREFIX_DEV}\" dir ..."
    cd "${DIR_PREFIX_DEV}"
    sudo svn co https://version-control.adelaide.edu.au/svn/a1731824/
}

function func_up
{
    echo "Entering \"${DIR_PREFIX_DEV}/a1731824\" dir ..."
    cd "${DIR_PREFIX_DEV}/a1731824"
    echo "Executing \"svn add * --force\" ..."
    svn add * --force
    echo "Executing \"svn commit -m \"$(date +%s)\"\" ..."
    svn commit -m "$(date +%s)"
}

# -------------
# main function
# -------------

function func_main
{
    local current_dir="$(pwd)"

    case "${1}"
    in
        "up")
            func_up
            ;;

        "down")
            func_down
            ;;
    esac

    echo "Entering \"${current_dir}\" ..."
    cd "${current_dir}"
}

# -----------------
# initialise script
# -----------------

script_name="$(basename "${BASH_SOURCE[0]}")"
absolute_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#cd "${absolute_path}"
func_main "$@"
