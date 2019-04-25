# executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files
#  in the package bash-doc for examples

# return if not running interactively
[ $1 != "*i*" ] && return

# beginning indication
printf "Beginning execution of \"${HOME}/.bashrc\"\n\n"

#set -E -o functrace
#trap "echo ${LINENO} ${BASH_COMMAND}" ERR

# make less more friendly for non-text input files, see lesspipe(1)
# TODO: check if this is portable, if it is, move it to ~/.profile
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# TODO: check if this is portable, if it is, move it to ~/.profile
HISTSIZE=1000
HISTFILESIZE=2000

# don't put duplicate lines or lines starting with space in the history.
# see bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and
# update the values of LINES and COLUMNS if necessary.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix
then
    if [ -f /usr/share/bash-completion/bash_completion ]
    then
        . /usr/share/bash-completion/bash_completion

    elif [ -f /etc/bash_completion ]
    then
        . /etc/bash_completion
    fi
fi

# finishing indication
printf "Finishing execution of \"${HOME}/.bashrc\"\n\n"
