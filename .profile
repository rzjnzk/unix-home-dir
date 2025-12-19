# NAME
#     .profile - Bourne-like shell run command script
#
# DESCRIPTION
#     The `~/.profile` script is executed by the command interpreter for login shells.
#     This file is not read by bash if `~/.bash_profile` or `~/.bash_login` exist.
#     See `/usr/share/doc/bash/examples/startup-files` for examples.
#     The files are located in the bash-doc package.
#
# AUTHORS
#     Copyright (c) Robert Zack Jaidyn Norris-Karr <https://github.com/rzjnzk>
#
# NOTES
#     Main Repository: <https://github.com/rzjnzk/unix-home-dir>

# BEGIN Sourcing shell-specific *rc scripts.

if
    test -n "${BASH_VERSION}"
then
    \. "${HOME}/.bashrc"
fi

# END Sourcing shell-specific *rc scripts.

# TODO: Move to default location.
export NVM_DIR="${HOME}/.nvm"
test -s "${NVM_DIR}/nvm.sh" && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
test -s "${NVM_DIR}/bash_completion" && \. "${NVM_DIR}/bash_completion"  # This loads nvm bash_completion

# TODO: Move to default location.
# Generated for envman. Do not edit.
test -s "${HOME}/.config/envman/load.sh" && . "${HOME}/.config/envman/load.sh"

# >>> 400a8a66-6b54-4a65-83a3-84f4831ea191 >>>
# WARNING: DO NOT EDIT THESE COMMENTS OR LINES.
export U_DIR="/home/user/.u"
# shellcheck source=/home/user/.u/etc/profile
\. "${U_DIR}/etc/profile"
# <<< 400a8a66-6b54-4a65-83a3-84f4831ea191 <<<