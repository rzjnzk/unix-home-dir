# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# --------------------
# beginning indication
# --------------------

printf "Beginning execution of \"${HOME}/.profile\"\n\n"

# -------------------------------------------
# print shell version and license information
# -------------------------------------------

printf "$(${SHELL} --version)\n\n"

# ---------------
# set permissions
# ---------------

chmod 700 -R "${HOME}"
chmod 600 "${HOME}/.ssh/config"
chmod 644 "${HOME}/uni/nand2tetris/tools/*.bat"
chmod 755 "${HOME}/uni/nand2tetris/tools/*.sh"

# -------------------------
# set environment variables
# -------------------------

# set the display for x-server use with non-gui environments such as WSL
export DISPLAY=:0
# set the default text editor
export EDITOR="vim"
export VISUAL="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# -------------------
# set prompt variable
# -------------------

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]
then
    debian_chroot="$(cat /etc/debian_chroot)"
fi

# check for color support
# ref: https://stackoverflow.com/questions/3722524/testing-for-color-support-in-linux-shell-scripts
if [ -x /usr/bin/tput ] && tput setaf 1 > /dev/null 2>&1
then
    # assume color support is  compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)

    PS1_CALCULATE_PROMPT()
    {
        # get exit code of command prior to PS1 prompt
        _exit_code=${?}

        # last output no newline fix, with additional newline.
        printf "%$(($(tput cols)-1))s\r\n"

        # line 1, user info
        # -----------------

        printf "\e[7m "

        if [ ! -z "${SSH_CLIENT}" ]
        then
            printf "${SSH_CLIENT} \xe2\x87\x94  "
        fi

        printf "${debian_chroot:+($debian_chroot)}"
        # user@hostname (PS1 equivelent: \u@\H)
        printf "$(whoami)@$(hostname) "
        printf "\e[0m "
        # shell name
        # TODO: prepend shell version
        printf "\e[7m $(ps -p $$ -oargs=) \e[0m "
        # time and date
        printf "\e[7m $(date +%H:%M:%S) \e[0m "
        printf "\e[7m $(date +%d/%m/%Y) \e[0m "

        # exit code of command prior to prompt
        if [ "${_exit_code}" != "0" ]
        then
            printf "\e[0;31m\e[7m ${_exit_code} \e[0m "
        else
            printf "\e[0;32m\e[7m ${_exit_code} \e[0m "
        fi

        printf ">\n"

        # line 2, working dir
        # -------------------

        printf "\033[01;34m\e[96m\xe2\x94\x9c\xe2\x94\x80\xe2\x94\x80 $(pwd)\033[00m"
        printf "\n"

        # line 3 (potentially), repository information
        # --------------------------------------------

        _git_branch_name="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
        _git_origin_name="$(git config --get remote.origin.url)"

        # if the current dir is a git repository
        if [ ! -z "${_git_branch_name}" ]
        then
            printf "\e[96m\xe2\x94\x9c\xe2\x94\x80\xe2\x94\x80 ${_git_origin_name}\e[0m\n"
            printf "\e[96m\xe2\x94\x94\xe2\x94\x80\xe2\x94\x80 ${_git_branch_name}\e[0m\n"
            # TODO: \x01\xF5\xA7
        fi

        # update the values of LINES and COLUMNS regardless of whether the terminal has been physically resized
        # ref: https://www.mankier.com/1/resize
        printf "$(resize > /dev/null 2>&1)"

        # TODO: support svn and other remotes
        # TODO: colourise user@hostname and neighbouring sections
        # TODO: support non-colour terminals, and have no-colour variable optionally skip colour, use same name as default bashrc, this variable could be set manually before resourceing the bashrc, or set my the process invoking bash
        # TODO: consider adding bash job count, ie background jobs / subproccesses running
        # TODO: consider adding current repo revision number, or information relative either to the repo, or the dir in the repo
    }

    PS1="\$(PS1_CALCULATE_PROMPT)\n\n\[\e[34m\]$\[\e[0m\] "
else
    PS1="\n${debian_chroot:+($debian_chroot)}\u@\h:\n\w\$(resize > /dev/null 2>&1)\n\n$ "
fi

# if this is an xterm set the title to user@host:dir
case "$TERM"
in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]${PS1}"
        ;;
esac

# ---------------------------------
# source shell-specific *rc scripts
# ---------------------------------

# if running bash, source the users .bashrc
[ -n "${BASH_VERSION}" ] && [ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"

# ---------------------------------------------------------------
# set user script sourcing functions for '${HOME}/cmd/*/index.sh'
# ---------------------------------------------------------------

# set dir prefix shell variables
. "${HOME}/dir-prefixes.sh"

printf "Looking for ${HOME}/cmd/*/index.sh\n"
printf "Function \"*\" executes subsequent script, for ...\n"
printf "\n"

for _dir in $(cd "${HOME}/cmd/" && echo ./* | sed -E "s/\.\///g")
do
    if [ -d "${HOME}/cmd/${_dir}" ]
    then
        eval "${_dir}() { . \"${HOME}/cmd/${_dir}/index.sh\" ; }" \
            && printf "${_dir}\n"
    fi
done

# ----------------------
# export *PATH variables
# ----------------------

# TODO: consider checking for the dirs existance per dir, consider edge cases, and other dynamic factors of influence

export PATH="${PATH}" \
    # include user bin if the dir exists
    "$([ -d "${HOME}/bin" ] && printf ":${HOME}/bin")" \
    "$([ -d "${HOME}/.local/bin" ] && printf ":${HOME}/.local/bin")" \
    # metabox laptop : wsl ubuntu
    ":${HOME}/uni/nand2tetris/tools" \
    # CAT suite : redhat linux
    # note: CAT suite: /usr/local/nand2tetris/tools:/usr/java/jdk1.8.0_181-amd64/bin
    ":/usr/local/nand2tetris/tools" \
    ":/usr/java/jdk1.8.0_181-amd64/bin" \
    # homebrew/linuxbrew
    ":/home/linuxbrew/.linuxbrew/bin"

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}" \
    # include user dynamically linked libs if the dir exists
    "$([ -d "${HOME}/.local/lib" ] && printf ":${HOME}/.local/lib")"

export MANPATH="${MANPATH}" \
    # homebrew/linuxbrew
    ":/home/linuxbrew/.linuxbrew/share/man"

export INFOPATH="${INFOPATH}" \
    # homebrew/linuxbrew
    ":/home/linuxbrew/.linuxbrew/share/info"

# TODO: dynamically check host names from script names under, for example, `./user-hosts`, and move mechine specific or unique logic there. This folders contents should be fully encrypted, either including the file name, of me move entirely, which is cleaner. Consider the case in which the host name might change, and how that case should be handled, whether by a method to asertain the name, or manual user input. A default script should run if the mechine does not match a file, in which a file should be created along with any other possible actions.
if [ "$(hostname)" = "DESKTOP-DCHFQSJ" ]
then
    # # ConEmu WSL extended buffer length
    # printf "\e[32766H"

    emacs()
    {
        "/mnt/e/d/User/emacs-26.2-x86_64/runemacs.exe"
    }
fi

# --------------------
# finishing indication
# --------------------

printf "\n"
printf "Finishing execution of \"${HOME}/.profile\"\n\n"
