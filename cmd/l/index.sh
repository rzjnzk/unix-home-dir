#!/bin/bash

# More readable ls alternative
# Author: Robert Z. J. Norris-Karr (https://github.com/rzjnzk)

# ---------
# functions
# ---------

_sed_colourise_permissions ()
{
    printf "%s" \
        "s/r/$(tput setaf 2)r$(tput sgr0)/g;" \
        "s/w/$(tput setaf 5)w$(tput sgr0)/g;" \
        "s/x/$(tput setaf 1)x$(tput sgr0)/g"
}

# -------------
# main function
# -------------

_main ()
{
    # _detailed_ls_of_given_dir=$(ls -all --format=single-column --classify --color=none ${@})

    _current_dir="$(pwd)"

    if [ -z ${@} ]
    then
        set -- "."
    fi

    _output=""

    IFS=$'\n'

    for _dir in ${@}
    do
        cd "${_dir}"
        printf "$(pwd):\n\n"

        _output="${_output}NAME SIZE PERMISSIONS MODIFIED\n"
        _output="${_output}---- ---- ----------- --------\n"

        _dir_contents="$(ls -all --format=single-column --color=none)"

        for _item in ${_dir_contents}
        do
            _output="${_output}$(stat --dereference --printf="%n %s %A/%a " "${_item}")"
            _output="${_output}$(stat --dereference --printf="%y" "${_item}" | sed "s/.\{16\}$//")\n"
        done

        printf "\n"

    done

    unset IFS

    printf "$(printf "${_output}" | column -t)"

    cd ${_current_dir}
}

# -----------------
# initialise script
# -----------------

script_name="$(basename "${BASH_SOURCE[0]}")"
absolute_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#cd "${absolute_path}"
_main "$@"

# _main ()
# {
#     # _detailed_ls_of_given_dir=$(ls -all --format=single-column --classify --color=none ${@})
#
#     _current_dir="$(pwd)"
#
#     if [ -z ${@} ]
#     then
#         set -- "."
#     fi
#
#     _output=""
#
#     IFS=$'\n'
#
#     for _dir in ${@}
#     do
#         cd "${_dir}"
#         printf "$(pwd):\n\n"
#
#         #_output="${_output}NAME SIZE PERMISSIONS MODIFIED\n"
#         #_output="${_output}---- ---- ----------- --------\n"
#
#         _dir_contents="$(ls -all --format=single-column --color=none)"
#
#         for _item in ${_dir_contents}
#         do
#             _output="${_output}$(stat --dereference --printf="%n " "${_item}")"
#             _output="${_output}$(stat --dereference --printf="%s " "${_item}")"
#             _output="${_output}$(stat --dereference --printf="%A_%a " ${_item}")" # | sed "$(_sed_colourise_permissions)"
#             _output="${_output}$(stat --dereference --printf="%y" "${_item}" | sed "s/.\{16\}$//")"
#             _output="${_output}\n"
#         done
#
#         unset
#     done
#
#     unset IFS
#
#     _output="$(printf "${_output}" | column -t)"
#
#     printf "${_output}"
#
#     cd ${_current_dir}
