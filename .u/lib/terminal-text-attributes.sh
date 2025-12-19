#!/bin/sh

# TODO: Consider setting all values like `_lib_terminal_text_attributes__setaf_x` and `_lib_terminal_text_attributes__setab_x`.

# TODO:  Add attributes from the `testterm` script that are not supported by `tput` but have ANSI escape codes.

# TODO: Consider adding ANSI escape code fallbacks for terminals that do not support `tput`, in conjunction with testing color support via some other method, such as checking the value of `${COLORTERM}`, or any other variables, shell built-ins, executable, functions, or files.

_lib_terminal_text_attributes__colors="$(tput colors 2> /dev/null)"

# TODO: Consider separating each case out to its own function for better performance.
_lib_terminal_text_attributes()
{
    if
        test "${1}" = "fg"
    then
        if
            test "${2}" -lt "${_lib_terminal_text_attributes__colors}" 2> /dev/null
        then
            tput setaf "${2}" 2> /dev/null
        elif
            test "${2}" = "black"
        then
            tput setaf 0 2> /dev/null
        elif
            test "${2}" = "red"
        then
            tput setaf 1 2> /dev/null
        elif
            test "${2}" = "green"
        then
            tput setaf 2 2> /dev/null
        elif
            test "${2}" = "yellow"
        then
            tput setaf 3 2> /dev/null
        elif
            test "${2}" = "blue"
        then
            tput setaf 4 2> /dev/null
        elif
            test "${2}" = "magenta"
        then
            tput setaf 5 2> /dev/null
        elif
            test "${2}" = "cyan"
        then
            tput setaf 6 2> /dev/null
        elif
            test "${2}" = "white"
        then
            tput setaf 7 2> /dev/null
        elif
            test "${2}" = "bright-black"
        then
            tput setaf 8 2> /dev/null
        elif
            test "${2}" = "bright-red"
        then
            tput setaf 9 2> /dev/null
        fi
    elif
        test "${1}" = "bg"
    then
        if
            test "${2}" -lt "${_lib_terminal_text_attributes__colors}" 2> /dev/null
        then
            tput setab "${2}" 2> /dev/null
        elif
            test "${2}" = "black"
        then
            tput setab 0 2> /dev/null
        elif
            test "${2}" = "red"
        then
            tput setab 1 2> /dev/null
        elif
            test "${2}" = "green"
        then
            tput setab 2 2> /dev/null
        elif
            test "${2}" = "yellow"
        then
            tput setab 3 2> /dev/null
        elif
            test "${2}" = "blue"
        then
            tput setab 4 2> /dev/null
        elif
            test "${2}" = "magenta"
        then
            tput setab 5 2> /dev/null
        elif
            test "${2}" = "cyan"
        then
            tput setab 6 2> /dev/null
        elif
            test "${2}" = "white"
        then
            tput setab 7 2> /dev/null
        elif
            test "${2}" = "bright-black"
        then
            tput setab 8 2> /dev/null
        elif
            test "${2}" = "bright-red"
        then
            tput setab 9 2> /dev/null
        fi
    elif
        test "${1}" = "default"
    then
        tput sgr0 2> /dev/null
    elif
        test "${1}" = "bold"
    then
        tput bold 2> /dev/null
    elif
        test "${1}" = "dim"
    then
        tput dim 2> /dev/null
    elif
        test "${1}" = "underline"
    then
        tput smul 2> /dev/null
    elif
        test "${1}" = "blink"
    then
        tput blink 2> /dev/null
    elif
        test "${1}" = "reverse"
    then
        tput rev 2> /dev/null
    elif
        test "${1}" = "standout"
    then
        tput smso 2> /dev/null
    elif
        test "${1}" = "italics"
    then
        tput sitm 2> /dev/null
    elif
        test "${1}" = "no_underline"
    then
        tput rmul 2> /dev/null
    elif
        test "${1}" = "no_standout"
    then
        tput rmso 2> /dev/null
    elif
        test "${1}" = "no_italics"
    then
        tput ritm 2> /dev/null
    else
        printf "%s\n" "Invalid argument for function \`_lib_terminal_text_attributes\`: \`${1}\`." 1>&2

        return 1
    fi
}

if
    test "${_lib_terminal_text_attributes__colors}" -gt 8
then
    _lib_terminal_text_attributes__fg_black="$(tput setaf 0 2> /dev/null)"
    _lib_terminal_text_attributes__fg_red="$(tput setaf 1 2> /dev/null)"
    _lib_terminal_text_attributes__fg_green="$(tput setaf 2 2> /dev/null)"
    _lib_terminal_text_attributes__fg_yellow="$(tput setaf 3 2> /dev/null)"
    _lib_terminal_text_attributes__fg_blue="$(tput setaf 4 2> /dev/null)"
    _lib_terminal_text_attributes__fg_magenta="$(tput setaf 5 2> /dev/null)"
    _lib_terminal_text_attributes__fg_cyan="$(tput setaf 6 2> /dev/null)"
    _lib_terminal_text_attributes__fg_white="$(tput setaf 7 2> /dev/null)"
    _lib_terminal_text_attributes__fg_black_bright="$(tput setaf 8 2> /dev/null)"
    _lib_terminal_text_attributes__fg_red_bright="$(tput setaf 9 2> /dev/null)"

    _lib_terminal_text_attributes__bg_black="$(tput setab 0 2> /dev/null)"
    _lib_terminal_text_attributes__bg_red="$(tput setab 1 2> /dev/null)"
    _lib_terminal_text_attributes__bg_green="$(tput setab 2 2> /dev/null)"
    _lib_terminal_text_attributes__bg_yellow="$(tput setab 3 2> /dev/null)"
    _lib_terminal_text_attributes__bg_blue="$(tput setab 4 2> /dev/null)"
    _lib_terminal_text_attributes__bg_magenta="$(tput setab 5 2> /dev/null)"
    _lib_terminal_text_attributes__bg_cyan="$(tput setab 6 2> /dev/null)"
    _lib_terminal_text_attributes__bg_white="$(tput setab 7 2> /dev/null)"
    _lib_terminal_text_attributes__bg_black_bright="$(tput setab 8 2> /dev/null)"
    _lib_terminal_text_attributes__bg_red_bright="$(tput setab 9 2> /dev/null)"
else
    _lib_terminal_text_attributes__fg_black=""
    _lib_terminal_text_attributes__fg_red=""
    _lib_terminal_text_attributes__fg_green=""
    _lib_terminal_text_attributes__fg_yellow=""
    _lib_terminal_text_attributes__fg_blue=""
    _lib_terminal_text_attributes__fg_magenta=""
    _lib_terminal_text_attributes__fg_cyan=""
    _lib_terminal_text_attributes__fg_white=""
    _lib_terminal_text_attributes__fg_black_bright=""
    _lib_terminal_text_attributes__fg_red_bright=""

    _lib_terminal_text_attributes__bg_black=""
    _lib_terminal_text_attributes__bg_red=""
    _lib_terminal_text_attributes__bg_green=""
    _lib_terminal_text_attributes__bg_yellow=""
    _lib_terminal_text_attributes__bg_blue=""
    _lib_terminal_text_attributes__bg_magenta=""
    _lib_terminal_text_attributes__bg_cyan=""
    _lib_terminal_text_attributes__bg_white=""
    _lib_terminal_text_attributes__bg_black_bright=""
    _lib_terminal_text_attributes__bg_red_bright=""
fi

_lib_terminal_text_attributes__default="$(tput sgr0 2> /dev/null)"

# TODO: Ensure non-color text attributes are blank strings if not supported.
_lib_terminal_text_attributes__bold="$(tput bold 2> /dev/null)"
_lib_terminal_text_attributes__dim="$(tput dim 2> /dev/null)"
_lib_terminal_text_attributes__underline="$(tput smul 2> /dev/null)"
_lib_terminal_text_attributes__blink="$(tput blink 2> /dev/null)"
_lib_terminal_text_attributes__reverse="$(tput rev 2> /dev/null)"
_lib_terminal_text_attributes__standout="$(tput smso 2> /dev/null)"
_lib_terminal_text_attributes__italics="$(tput sitm 2> /dev/null)"
_lib_terminal_text_attributes__no_underline="$(tput rmul 2> /dev/null)"
_lib_terminal_text_attributes__no_standout="$(tput rmso 2> /dev/null)"
_lib_terminal_text_attributes__no_italics="$(tput ritm 2> /dev/null)"

_lib_terminal_text_attributes__setaf_x()
{
    if
        test "${1}" -lt "${_lib_terminal_text_attributes__colors}"
    then
        eval "_lib_terminal_text_attributes__fg_${1}=\"\$(tput setaf ${1} 2>/dev/null)\""
    else
        eval "_lib_terminal_text_attributes__fg_${1}=\"\""
    fi
}

_lib_terminal_text_attributes__setab_x()
{
    if
        test "${1}" -lt "${_lib_terminal_text_attributes__colors}"
    then
        eval "_lib_terminal_text_attributes__bg_${1}=\"\$(tput setab ${1} 2>/dev/null)\""
    else
        eval "_lib_terminal_text_attributes__bg_${1}=\"\""
    fi
}
