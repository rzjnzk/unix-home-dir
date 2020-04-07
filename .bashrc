# NAME
#     .bashrc - BASH run command script
#
# DESCRIPTION
#     The `~/.bashrc` script is executed by bash for non-login shells.
#     See `/usr/share/doc/bash/examples/startup-files` for examples.
#     The files are located in the bash-doc package.
#
# AUTHORS
#     Copyright (c) Robert Zack Jaidyn Norris-Karr <rzjnzk@gmail.com> <https://github.com/rzjnzk>
#
# NOTES
#     Main Repository: <https://github.com/rzjnzk/unix-home-dir>

# Return if not running interactively.
test "${1}" = "*i*" || return

# Disable bell sound.
# TODO: Check for portability.
set bell-style none

#set -E -o functrace
#trap "echo ${LINENO} ${BASH_COMMAND}" ERR

# Make `less` more friendly for non-text input files, see lesspipe(1).
# TODO: Check for portability.
test -x /usr/bin/lesspipe && eval "$(SHELL=/bin/sh lesspipe)"

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1).
# TODO: Check for portability.
HISTSIZE=1000
HISTFILESIZE=2000

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options.
# TODO: Check for potability.
HISTCONTROL=ignoreboth

shopt -s histappend

# Check the window size after each command and
# update the values of LINES and COLUMNS if necessary.
shopt -s checkwinsize

shopt -s dotglob

if
! shopt -oq posix
then
   	test -f /usr/share/bash-completion/bash_completion &&
        . /usr/share/bash-completion/bash_completion

    test -f /etc/bash_completion &&
        . /etc/bash_completion
fi
