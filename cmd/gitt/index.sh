#!/bin/bash

# Test script
# Author: Robert Z. J. Norris-Karr (https://github.com/rzjnzk)

# ---------
# functions
# ---------

function func_push
{

}

function func_pull
{
	git pull origin master
}

# -------------
# main function
# -------------

function func_main
{
    case "${1}"
    in
        "d")
            git pull origin master || \

            if [ $? -ne 0 ]
            then
                if [ "${2}" != "" ]
                then
                    git clone "${2}"
                else
                    echo "Current dir not a git repository."
                    echo "Please use \"gitt d <repository-name>\""
                fi
            fi
            ;;

        "u")
            git add --all || continue
            git commit -m "$(date +%s)" || continue
            git push origin master
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
