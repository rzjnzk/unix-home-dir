#!/bin/sh

# TODO: Ensure there is no chance of variable conflicts between all three scripts: the caller script, this sourced script, and scripts sourced by this script.

_newline="$(printf "\n")"
_is_read_args=false

printf "%s" "${_IMPORTS}" \
| while
    IFS="" read -r _line
do
    if
        test "${_is_read_args}" = true
    then
        if
            printf "%s" "${_line}" | sed -n "/^[ \\t]*import /p" > /dev/null 2>&1
        then
            _is_read_args=false
        else
            _ARGS="${_ARGS}${_line}${_newline}"
        fi
    # TODO: Potentially reduce, if possible, by moving the `_path_import` var assignment into the if condition, and then checking the `$?` var subsequently in the condition.
    elif
        printf "%s" "${_line}" | sed -n "/^[ \\t]*import /p" > /dev/null 2>&1
    then
        _path_import="${SCRIPT_PATH}/lib.d/$(printf "%s" "${_line}" | sed -n "s/^[ \\t]*import \([^ ]*\).*/\1/p")"
        _ARGS=""
        _is_read_args=true
    fi

    if
        test "${_is_read_args}" = false \
        && test -n "${_path_import}"
    then
        if
            test -f "${_path_import}"
        then
            . "${_path_import}"
        else
            printf "%s\n" "Error: Lib not found. \`${_path_import}\`." 1>&2
            exit 1
        fi

        _path_import=""
    fi
done






printf "%s" "${_IMPORTS}" \
| while
    IFS="" read -r _line
do
    if
        printf "%s" "${_line}" | sed -n "/^[ \\t]*import /p" > /dev/null 2>&1
    then
        _path_import="${SCRIPT_PATH}/lib.d/$(printf "%s" "${_line}" | sed -n "s/^[ \t]*import \([^ ]*\).*/\1/p")"

        _ARGS=""

        while
            IFS="" read -r line
        do
            # Break if the line starts with "import"
            if printf "%s" "$line" | sed -n '/^import/p' >/dev/null; then
                break
            fi
            # Append the line to new_var
            _ARGS="${_ARGS}${line}
        "
        done

        if
            test -f "${_path_import}"
        then
            . "${_path_import}"
        else
            printf "%s\n" "Error: Lib not found. \`${_path_import}\`." 1>&2
            exit 1
        fi
    fi
done
