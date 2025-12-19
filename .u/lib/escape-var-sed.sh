#!/bin/sh

# _escape_var_sed()
# {
#     if
#         test -z "${1}"
#     then
#         printf "Error: The first parameter of \`_escape_var_sed\` must be a non-empty string." 1>&2
#         exit 1
#     elif
#         test "$(expr "${2}" : '.*')" -gt 1
#     then
#         printf "Error: The second parameter of \`_escape_var_sed\` must be a single character if provided." 1>&2
#         exit 1
#     fi

#     (
#         if
#             test -n "${2}"
#         then
#             # TODO: Handle delimiters that have a special meaning when escaped.
#             # TODO: Handle any characters that cannot be used as delimiters, if they exist.
#             _delimiter="${2}"
#         else
#             _delimiter="/"
#         fi

#         printf "%s\n" "${1}" | sed "s/[${_delimiter}CHARACTERS_TO_ESCAPE_HERE]/\\\\&/g"
#     )
# }

# for \
#     _char in $_special_chars
# do
#     if [ "$2" = "$_char" ]; then
#         # your code here
#         break
#     fi
# done

# _escape_var_sed()
# {
#     if
#         test "${1}" = "lhs"
#     then
#         printf "%s" "${1}" | sed 's/[\\&\/.^$*(){}+?|[\]]/\\&/g'
#     elif
#         test "${1}" = "rhs"
#     then
#         printf "%s" "${1}" | sed 's/[\\&/]/\\&/g; $!s/$/\\/g'
#     else
#         return 1
#     fi
# }

# printf '%s\n' "$1" | sed 's/[\\&/]/\\&/g; $!s/$/\\/g'

# special_chars="/ \\ & . ^ $ * + ? | [ ]"

# for char in $special_chars; do
#     if [ "$2" = "$char" ]; then
#         # your code here
#         break
#     fi
# done

# $1 = The input string/variable contents to escape.
# $2 = Optional: The delimiter to use instead of '/'. If provided, also escape it.
_lib__escape_var_sed()
{
    # 2. Escape all potentially special sed characters:
    #    . * [ ] ( ) ^ $ { } | ? + &
    #
    #    Each of these substitutions is carefully quoted with double quotes.
    #    Note: `\$` in double quotes is a literal `$` to the shell, so sed sees s/\$/\\$/g correctly.
    # NOTE: All special chars that only having meaning are preceeded
    # _str="$(
    #     printf "%s\n" "${1}" \
    #     | sed \
    #         "
    #             s/\\//\\\\//g;
    #             s/\\^/\\^/g;
    #             s/\\$/\\\$/g;
    #             s/\\./\\\\./g;
    #             s/\\*/\\\\*/g;
    #             s/[/\\[/g;
    #             s/]/\\]/g;
    #             s/|/\\|/g;
    #             s/?/\\?/g;
    #             s/+/\\+/g;
    #             s/&/\\&/g;
    #         "
    # )"

    # _special_chars_sed_pattern=""
    # test -n "$(printf "%s" "${2}" | sed -n "/^${_special_chars_sed_pattern}$/p")"

    # Escape backslashes, then escape the following with a `\`: `][{}/^\$.*|?+&`.
    _str="$(printf "%s\n" "${1}" | sed "s/\\\\//g; s/[]\[\{\}\/\^\$\.\*\|\?\+&]/\\&/g")"

    # If the second arg is a single char.
    # TODO: What is the purpose of preventing the escape of `c`?

    if
        test -z "${2}"
    then
        :
    elif
        test -z "$(printf "%s" "${2}" | sed -n "/^.$/p")"
    then
        printf "Error: Arg 2 must be a single character." 1>&2
        exit 1
    else
        :
    fi

    # then
    #     printf "Error: Character conflicts with sed pattern special characters." 1>&2
    #     exit 1
    # if
    #     test "${2}" != "c"
    # then
    #     _str="$(printf "%s\n" "${_str}" | sed "s/${2}/\\\\${2}/g")"
    # elif
    #     test "$(expr "${2}" : ".*")" -gt 1
    # then

    # fi

    # Output the escaped string.
    printf "%s\n" "${_str}"
}
