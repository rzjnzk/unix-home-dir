#!/bin/sh

set -e

## BUNDLE LIBS
\. "${HOME}/bin/lib.d/escape-var-sed.sh"

_lib__arg_parser()
{
    while 
        test -n "${1}"
    do
        case \
            "${1}"
        in
            -- \
            )
                break
            ;;
            bool \

        esac
        then
            break
        elif
            test "${1}" = "bool"
        then
        elif
            test 
        then
        fi

    done
}

set \
| while 
    IFS="" read -r _line
do
    # Extract variables names. Variable names preceded by spaces, meaning that they are in function scopes are not considered 
    _var_name="$(printf "%s" "${_line}" | sed -n "s/^\\([^ ][^ ]*\\)*=.*/\\1/")"
    
    case \
        "${_var_name}"
    in
        _lib__arg_parser__* \
        )
            eval "_var_value=\"\$${_var_name}\""
            
            _var_value_new=""

            # _var_selected_parser=""

            _commandline
            for \
                _item in ${_var_value}
            do
                case \
                    "${_item}"
                in
                    boolean \
                    )
                        
                    ;;
                    val \
                    )
                    ;;
                esac
            done
            # Safely update the variable using 'eval'
            # Since variable names are controlled and come from 'set', risk is minimal
            eval "${_var_name}=\"${_var_value_new}\""
        ;;
    esac
done




