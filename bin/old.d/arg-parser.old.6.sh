#!/bin/sh

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

# _parent_eval_var_name()
# {
#     while \
#         "{1}"
#     do
#         eval "printf \"%s\n\" \"${1}=\${${2}}\"" >&3

#         shift 2
#     done
# }

# _parent_eval_var_name \
#     _var_name \
#     _var_name_remainder

set -e

_lib__arg_parser()
{
    # Pipe subshell to `eval`.
    eval "$(
        # Nullify all output and use file descriptor 3 to execute output lines through the pipe to `eval`.
        exec 3>&1 1>/dev/null 2>&1
        printf "%s\n" "_rzjnzk1=hello1" >&3
        printf "%s\n" "_rzjnzk2=hello2"

        # Define error printing helper function.
        _print_err()
        {
            printf "%s\n" "printf \"%s\n\" \"Error: ${1}\" 1>&2" >&3
        }

        # Store and shift arg parser configuration arguments.

        _parser_args=""

        while \
            test "${1}" != "--"
        do
            _parser_args="${1} "

            shift
        done

        shift

        # Determine whether the arg parser is configured to calculate remainder script arguments that are beyond the reach of the final array, or the `--` delimiter.

        _var_name_remainder=""

        for \
            _parser_arg in ${_parser_args}
        do
            if
                test "${_next_stage}" = "REMAINDER" \
                && test -z "$(printf "%s" "${_parser_arg}" | sed -n "/^--/p")"
            then
                _var_name_remainder="${_parser_arg}"

                break
            fi

            if
                test "${_parser_arg}" = "--remainder"
            then
                _next_stage="REMAINDER"
            fi
        done

        _flag_last=""

        # If the parser is configured to get the remainder.
        if
            test -n "${_var_name_remainder}"
        then
            _is_found_end_of_options=false

            # Get the scripts last flag argument.
            for \
                _arg in "${@}"
            do
                if
                    test "${_arg}" = "--"
                then
                    break
                elif
                    test -n "$(printf "%s" "${_arg}" | sed -n "/^-/p")"
                then
                    _flag_last="${_arg}"
                fi 
            done
        fi

        _type=""
        _next_stage=""

        for \
            _parser_arg in ${_parser_args}
        do
            case \
                "${_next_stage}"
            in
                "" \
                )
                    :
                ;;
                "GET_VAR_NAME" \
                )
                    # TODO: Validate `_var_name` for illegal characters.
                    _var_name="${_parser_arg}"

                    eval "${_var_name}=\"\""

                    case \
                        "${_var_type}"
                    in
                        "BOOL" \
                        )
                            _next_stage="PARSE_BOOL"
                        ;;
                        "ARRAY" \
                        )
                            _next_stage="GET_ARRAY_LENGTH"
                        ;;
                    esac
                ;;
                "GET_ARRAY_LENGTH" \
                )
                    _array_length="${_parser_arg}"

                    # If `_array_length` not `n` or a digit. Validation. 
                    if
                        test -n "$(printf "%s" "${_array_length}" | -n "/[n\\d]/p")"
                    then
                        _next_stage="PARSE_ARRAY"
                    else
                        _print_err "\`_lib__arg_parser\` function expected a digit or \`n\` after \`--array\`."

                        _next_stage=""
                    fi
  
                ;;
                "PARSE_ARRAY" \
                )
                    for \
                        _arg_name in ${_parser_arg}
                    do
                        # Determine whether short or long option.
                        if
                            test -n "$(printf "%s" "${_arg_name}" | sed -n "/^.$/p")"
                        then
                            _is_short_option=true
                        else
                            _is_short_option=false

                           # Check for verbose array format and parse if found.
                           # If searching for array start location: long option, commas delimited.
                           _array_vals="$(
                                printf "%s\n" "${@}"  | sed -n \
                                    "
                                        /^--${_arg_name}=/ \
                                        {
                                            s/^--${_arg_name}=//;
                                            s/\(^\|,\)\([^,\"]*\"[^\"]*\"[^,]*\|[^,]*'[^']*'[^,]*\|[^,\"]*\)/\2 /g;
                                            p;
                                        }
                                    "
                            )"

                            # Add parsed array values to the output variable.
                            if
                                test -n "${_array_vals}"
                            then
                                eval "${_var_name}=\"${_var_name} ${_array_vals}\""

                                continue
                            fi
                        fi

                        # Determine whether to calculate `_var_name_remainder`.

                        _is_flag_last=false

                        if
                            test -n "${_flag_last}"
                        then
                            case \
                                "${_arg_name}"
                            in
                                "--${_flag_last}" | "-${_flag_last}" \
                                )
                                    _is_flag_last=true
                                ;;
                            esac
                        fi

                        # Search for array options and parse the array values.

                        _count="${_array_length}"

                        # For each script arg.
                        for \
                            _arg in "${@}"
                        do
                            _is_reading_array=false

                            # If reading array and an option was not reached.
                            if
                                test "${_is_reading_array}" = "true" \
                                && test -n "$(printf "%s" "${_arg}" | sed -n "/^-/p")"
                            then
                                # If `_count` is `n` or the length of the array has not been succeeded.
                                if
                                    test "${_count}" = "n" \
                                    || test "${_count}" -gt 0
                                then
                                    eval "${_var_name}=\"\\\"${_arg}\\\" \""

                                    if
                                        test "${_count}" != "n"
                                    then
                                        _count=$((_count - 1))
                                    fi
                                # If array has been read, and if it is the last script flag being passed, calculate remainder.
                                elif
                                    test "${_is_flag_last}" = true
                                then
                                    if
                                        test -n "${_var_name_remainder}"
                                    then
                                        eval "${_var_name_remainder}=\"\\\"${_arg}\\\" \""
                                    fi
                                else
                                    continue
                                fi
                            # If searching for array start location: short option.
                            elif
                                test "${_is_short_option}" = true
                            then
                                # If short option in cluster, begin reading the array values on the next iteration.
                                if 
                                    test -n "$(printf "%s" "${_arg}" | sed -n "/^-[^-]*${_arg_name}$/p")"
                                then
                                    _is_reading_array=true
                                fi
                            # If searching for array start location: long option, space delimited. And if the long option is found, begin reading the array values on the next iteration.
                            elif
                                test -n "$(printf "%s" "${_arg}" | sed -n "/^--${_arg_name}$/p")"
                            then
                                _is_reading_array=true
                            fi
                        done
                    done

                    # Execute variable results in the lib function's calling shell.
                    
                    printf \"%s\n\" \
                        \"${_var_name}\"=\"\${${_var_name}}\" \
                        \"${_var_name_remainder}\"=\"\${${_var_name_remainder}}\" \
                        >&3
                    
                ;;
                "PARSE_BOOL" \
                )
                    for \
                        _arg_name in ${_parser_arg}
                    do
                        # If the option if present in the script args, set the `_var_name` to true.
                        # NOTE: Supports standalone and globbed short options and long options
                        if
                            { 
                                test -n "$(printf "%s" "${_arg_name}" | sed -n "/^.$/p")" \
                                && test -n "$(printf "%s\n" "${@}" | sed -n "/^-[^-]*${_arg_name}/p")"
                            } \
                            || test -n "$(printf "%s\n" "${@}" | sed -n "/^--${_arg_name}$/p")"
                        then
                            printf "%s\n" "${_var_name}=true" >&3

                            break
                        fi
                    done

                    _var_name=""
                    _next_stage=""
                ;;
            esac
                
            case \
                "${_parser_arg}"
            in
                --bool \
                )
                    _var_type="BOOL"
                    _next_stage="GET_VAR_NAME"
                ;;
                --array \
                )
                    _var_type="ARRAY"
                    _next_stage="GET_VAR_NAME"
                ;;
            esac
        done
    )"
}