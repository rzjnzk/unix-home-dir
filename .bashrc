# shellcheck disable=SC2148
# NAME
#     .bashrc - BASH run command script
#
# DESCRIPTION
#     The `~/.bashrc` script is executed by bash for non-login shells.
#     See `/usr/share/doc/bash/examples/startup-files` for examples.
#     The files are located in the bash-doc package.
#
# NOTES
#     Main Repository: <https://github.com/rzjnzk/unix-home-dir>

case $- in
    *i*) ;;
      *) return;;
esac

#set -E -o functrace
#trap "echo ${LINENO} ${BASH_COMMAND}" ERR

# Make `less` more friendly for non-text input files, see lesspipe(1).
# TODO: Check for portability.
# NOTE: In default file.
if
    test -x /usr/bin/lesspipe
then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1).
# TODO: Check for portability.
# NOTE: In default file.
HISTSIZE=1000
HISTFILESIZE=2000

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options.
# TODO: Check for potability.
# NOTE: In default file.
HISTCONTROL=ignoreboth

# NOTE: In default file.
shopt -s histappend

# Check the window size after each command and
# update the values of LINES and COLUMNS if necessary.
# NOTE: In default file.
shopt -s checkwinsize

# NOTE: In default file.
if
    ! shopt -oq posix \
    && ! \. /usr/share/bash-completion/bash_completion 2> /dev/null
then
    \. /etc/bash_completion 2> /dev/null
fi

alias grep="grep --color=auto"

export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

eval "$(gh copilot alias -- bash)"

# WARNING: DO NOT EDIT.
export U_DIR="${HOME}/.u"
\. "${U_DIR}/etc/bashrc" 2> /dev/null

# >>> 400a8a66-6b54-4a65-83a3-84f4831ea191 >>>
# WARNING: DO NOT EDIT THESE COMMENTS OR LINES.
export U_DIR="${HOME}/.u"
# shellcheck source=/home/user/.u/etc/profile
\. "${U_DIR}/etc/profile"
# <<< 400a8a66-6b54-4a65-83a3-84f4831ea191 <<<
