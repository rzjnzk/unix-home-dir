_lib__arg_parser()
{
    _lib__arg_parser_parser_args=""

    while \
        test "${1}" != "--"
    do
        _parser_args="\"${1}\" "

        shift
    done

    shift

    _type=""
    _next=""
    
    for \
        _parser_arg in ${_lib__arg_parser_parser_args}
    do
        case \
            "${_parser_arg}"
        in
            --bool \
            )
                _type="BOOL"
                _next="GET_VAR_NAME"
            ;;
            --array \
            )
                _type="ARRAY"
            ;;
        esac

        case \
            "${_next}"
        in
            GET_VAR_NAME \
            )
                _var_name="${_parser_arg}"
                _next="GET_ARG_NAMES"
            ;;
            GET_ARG_NAMES \
            )
                for \
                    _arg_name in ${_parser_arg}
                do
                    # If the option if present in the script args, set the `_var_name` to true.
                    # NOTE: Supports standalone and globbed short options and long options
                    if
                        { 
                            test -n "$(printf "%s" "${_arg_name}" | sed -n "/^.$/p")" \
                            && test -n "$(printf "%s\n" "${@}" | sed -n "/^-[^-]*${_arg_name}.*$/p")"
                        } \
                        || test -n "$(printf "%s\n" "${@}" | sed -n "/^--${_arg_name}$/p")"
                    then
                        eval "${_var_name}=true"

                        break
                    fi
                done
            ;;
        esac
    done
}