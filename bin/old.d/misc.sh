for \
    _path in "${@}"
do
    stat -c "File Name: %n (Type: %F)." "${_path}" 
    stat -c "    Access: %x." "${_path}"
    stat -c "    Modify: %y." "${_path}"
    stat -c "    Change: %z." "${_path}"
    stat -c "    Birth: %w." "${_path}"
    stat -c "    Size: %sb. Blocks: %b." "${_path}" 
    stat -c "    Access (Octal Format): %a." "${_path}"
    stat -c "    Device: %D. Inode: %i. Links: %h." "${_path}"
    printf "\n"
done || :

###############################################################################

# Print help and exit if a help flag was supplied.
test -n "$(printf "%s" "${@}" \
| sed -n "/^--help$/ p ; /^-h$/ p")" \
&& cat "${_script_path}/${_script_name}" \
| sed -n "3,/^$/ { s/^# // ; s/^#// ; p }" \
&& exit

###############################################################################

_script_args="$(printf "%s\n" "${@}")"
mkdir -p -- "${_script_path}/${_script_name}-logs"
_main "${@}" # | tee -a -- "${_script_path}/home.d/logs/$(date --utc +%Y-%m-%d_%H-%M-%S)_UTC.log"

###############################################################################

test -z "$(
    printf "%s" "${_path}" \
        | sed -n \
            "
                /\.old\$/d;
                p;
            "
)"

###############################################################################

# Not as portable as possible.
# /[^[:space:]]/,/^[[:space:]]*$/!d;

# More portable.
# /[^ ]/,/^[ ]*$/!d;

###############################################################################

# sed -n "/^# DESCRIPTION *$/,/^# *$/ {
#     s/^# //g;
#     s/^#//g;
#     p
# }" ~/bin/build

# cat "${_script_path}/${_script_name}" \
# | sed -n "/^# DESCRIPTION *$/,/^# [^ ]$/ { s/^# //g ; s/^#//g ; p }"

# cat "${_script_path}/${_script_name}" 
# | sed -n "3,/^$/ { s/^# //g ; s/^#//g ; p }"

###############################################################################
