#!/bin/sh

# TODO: Support non-flag arguments that are not `position`, since the position could be moved with the presence of flags, and not `after-args` or `before-args`.
# . "${_path_home_bin}/lib.d/arg-parser.sh" \
#     _is_args is-args \ 
#     _arg_first position 1 \
#     _is_verbose flag "-v --verb --verbose" \ #
#     _is_force flag "-f --force" \
#     _some_vals flag-vals n "-s --some-flag" \ # `-s val-1 val-2 val-3 -o non-val-1 non-val-2`, `--some-flag val-1 val-2 val-3 -o non-val-1 non-val-2`, `--some-flag=val-1,val-2,val-3 non-val-1`.
#     _some_vals flag-vals 2 "-s --some-flag" \ # `-s val-1 val-2 non-val-1 -o non-val-2 non-val-3`, `--some-flag val-1 val-2 non-val-1 -o non-val-2 non-val-3`, `--some-flag=val-1,val-2,errornous-val-1 non-val-1`.
#     _some_val flag-val "-o --other-flag" \ # `-s val-1 non-val-1 non-val-2 -o non-val-3 non-val-4`, `--some-flag val-1 non-val-1 non-val-2 -o non-val-3 non-val-4`, `--some-flag=val-1,val-1,val-1 non-val-1`.
#     _args_before_flags before-flags \ # `val-1 val-2 \-\-val-3 --some-flag non-val-1 non-val-2 --some-other-flag non-val-3 non-val-4`.
#     _args_after_flags after-flags \ # `non-val-1 non-val-2 \-\-non-val-3 --some-flag non-val-4 non-val-5 --some-other-flag non-val-3 non-val-4`, `non-val-1 non-val-2 \-\-non-val-3 --some-flag non-val-4 non-val-5 -- --not-a-flag-val-1 val-2 non-val-3`
#     -- "${@}"

# NOTE: The dot command does not support arguments in sh/dash. Set them as variables (https://www.shellcheck.net/wiki/SC2240).

_script_name="$(basename -- "${0}")"
_script_path="$(dirname -- "${0}")"

# # NOTE: Arguments might not be parsed, so erroring is not a good idea.
# if
#     test -z "${1}"
# then
#     printf "%s\n" "Error: Incorrect usege of arg parsing lib, no argements passed. \`${_script_path}/${_script_name}\`." 1>&2
#     exit 1
# fi



_lib_arg_parser()
{
    
}

(
    while 
        test -n "${1}"
    do

    done
)

_arg_purpose="VAR_NAME"

while
    test "${1}" != "--"
do
    if
        test "${_arg_purpose}" = "VAR_NAME"
    then
        _var_name="${1}"
        _arg_purpose="VAR_PURPOSE"
    elif
        test "${_arg_purpose}" = "VAR_PURPOSE"
    then
        _is_var_name=true
    fi

    if
        test "${#}" -gt 1
    then
        shift
    else
        break
    fi
done

printf "_args__parser: %s\n" "${_args__parser}"

# while
#     test "${1}" != "--args"
# do
#     _args__parser="${_args__parser}$(
#         printf "%s\n" "${1}" \
#         | sed "s/\\\\u200B/\\\\\\\\u200B/g" \
#         | while
#             IFS="" read -r _line
#         do
#             printf "%s" "${_line}"
#         done

#         printf "\\u200B"
#     )"

#     if
#         test "${#}" -gt 1
#     then
#         shift
#     else
#         break
#     fi
# done

# printf "_args__parser: %s\n" "${_args__parser}"

# while
#     test -n "${1}"
# do
#     _args__parent_script="${_args__parent_script}$(
#         printf "%s" "${1}" \
#         | sed "s/\\\\u200B/\\\\\\\\u200B/g" \
#         | while
#             IFS="" read -r _line
#         do
#             printf "%s\\u200B" "${_line}"
#         done
#     )\n"

#     shift
# done

# printf "%s" "${_args__parser}" \
# | while
#     IFS="" read -r _line
# do
#     _arg=$(printf "%s" "${_line}" | sed "s/\\\\\\\\u200B/\\\\u200B/g")

#     printf "%s" "${_arg}"
# done