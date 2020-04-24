# Print help and exit if a help flag was supplied.
test -n "$(printf -- "${_script_args}" | sed -n "/^--help$/ p ; /^-h$/ p")" &&
    cat "${_script_path}/${_script_name}" |
        sed -n "3,/^$/ { s/^# // ; s/^#// ; p }" &&
            exit
