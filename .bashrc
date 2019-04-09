# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# return if not running interactively
case $-
in
    *i*)
        ;;

    *)
        return
        ;;
esac

echo "Executing \"~/.bashrc\" ..."

# don't put duplicate lines or lines starting with space in the history.
# see bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]
then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# check for color support
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null
then
	# assume color support is  compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)

    function PS1_FUNCTION
    {
        # preceeding whitespace
        # ---------------------

        # last output no newline fix
        printf "%$(($(tput cols)-1))s\r"

        # empty line, aesthetic seperator
        printf "\n"

        # line 1, user info
        # -----------------

        printf "\e[7m "

        if [ ! -z ${SSH_CLIENT}]
        then
            printf "${SSH_CLIENT} \xe2\x87\x94 "
        fi

        printf "${debian_chroot:+($debian_chroot)}"
        # user@hostname (PS1 equivelent: \u@\H)
        printf "$(whoami)@$(hostname) "
        printf "\e[0m "
        printf "\e[7m"
        # shell name
        # TODO: prepend shell version
        printf " $(ps -p $$ -oargs=) "
        printf "\e[0m "
        printf "\e[7m $(date +%H:%M:%S) \e[0m "
        printf "\e[7m $(date +%d/%m/%Y) \e[0m >"
        printf "\n"

        # line 2, working dir
        # -------------------

        printf "\033[01;34m\xf0\x9f\x96\xb4  $(pwd)\033[00m"
        printf "\n"

        # line 3 (potentially), repository information
        # --------------------------------------------

        local _git_branch_name="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
        local _git_origin_name="$(git config --get remote.origin.url)"

        # if the current dir is a git repository
        if [ ! -z ${_git_branch_name} ]
        then
            printf "\e[96m\xf0\x9f\x96\xa7  ${_git_origin_name}\e[0m\n"
            printf "\e[96m\xe2\x8e\x87  ${_git_branch_name}\e[0m\n"
            # TODO: \x01\xF5\xA7
        fi

        # TODO: support svn and other remotes
        # TODO: colourise user@hostname and neighbouring sections
        # TODO: support non-colour terminals, and have no-colour variable optionally skip colour, use same name as default bashrc, this variable could be set manually before resourceing the bashrc, or set my the process invoking bash
        # TODO: consider adding bash job count, ie background jobs / subproccesses running
        # TODO: consider adding current repo revision number, or information relative either to the repo, or the dir in the repo
    }

    PS1="\$(PS1_FUNCTION)\n\n\[\e[34m\]$\[\e[0m\] "
else
    PS1="\n${debian_chroot:+($debian_chroot)}\u@\h:\n\w\\n\$ "
fi

# if this is an xterm set the title to user@host:dir
case "$TERM"
in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]${PS1}"
        ;;
esac

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

# set dir prefix shell variables
source "${HOME}/dir-prefixes.sh"

printf "\n"
printf "Looking for ${HOME}/cmd/*/index.sh\n"
printf "Function \"*\" executes subsequent script, for ...\n"
printf "\n"

for _dir in $(cd ${HOME}/cmd/ && echo *)
do
    if [ -d "${HOME}/cmd/${_dir}" ]
    then
        eval "function ${_dir} { . \"${HOME}/cmd/${_dir}/index.sh\" ; }" \
            && printf "${_dir}\n"
    fi
done

printf "\n"

# note: CAT suite: /usr/local/nand2tetris/tools:/usr/java/jdk1.8.0_181-amd64/bin
export PATH=${PATH} \
	# metabox laptop : wsl ubuntu
	# TODO: remove hardcoded home dir
	:"${HOME}/uni/nand2tetris/tools" \
	# CAT suite : redhat linux
	:"/usr/local/nand2tetris/tools" \
	:"/usr/java/jdk1.8.0_181-amd64/bin"


chmod 644 ${HOME}/uni/nand2tetris/tools/*.bat
chmod 755 ${HOME}/uni/nand2tetris/tools/*.sh

# print without escaping    printf "%s" "TEXT HERE"
 # | tr -d '\n'    this removes \n chars

 # function atom
 # {
 #         ~/Desktop/atom/atom ~/Desktop/
 # }

 # function PS1_FUNCTION
 # {
 #     # TODO: printf one new line when the previous output ended with a newline, print two newlines otherwise
 #     printf "\n\n"
 #
 #     # line 1, user info
 #     printf "\e[7m "
 #
 #     if [ ! -z ${SSH_CLIENT}]
 #     then
 #         printf "${SSH_CLIENT} \xe2\x87\x94 "
 #     fi
 #
 #     printf "${debian_chroot:+($debian_chroot)}"
 #     printf "$(whoami)@$(hostname) " # \u@\H
 #     printf "\e[0m "
 #     printf "\e[7m"
 #     # TODO: prepend shell version
 #     printf " $(ps -p $$ -oargs=) "
 #     printf "\e[0m "
 #     printf "\e[7m $(date +%H:%M:%S) \e[0m "
 #     printf "\e[7m $(date +%d/%m/%Y) \e[0m >"
 #     printf "\n"
 #
 #     # line 2, working dir
 #
 #     printf "\033[01;34m\xf0\x9f\x96\xb4  $(pwd)\033[00m"
 #     printf "\n"
 #
 #     # line 3 (potentially)
 #     # repository information
 #
 #     # if the current dir is a repository
 #     local _git_branch_name="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
 #     local _git_origin_name="$(git config --get remote.origin.url)"
 #
 #     if [ ! -z ${_git_branch_name} ]
 #     then
 #         printf "\e[96m\xf0\x9f\x96\xa7  ${_git_origin_name}\e[0m\n"
 #         printf "\e[96m\xe2\x8e\x87  ${_git_branch_name}\e[0m\n"
 #         # TODO: \x01\xF5\xA7
 #     fi
 #
 #     printf "\n"
 #
 #     # line 4 (potentially 5)
 #     # command entry line
 #
 #     printf "\e[34m\$\e[0m "
 # }
 #
 # PS1="\$(PS1_FUNCTION)"
