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
#     Copyright (c) Robert Zack Jaidyn Norris-Karr <rzjnzk@gmail.com> <https://github.com/rzjnzk>
#
# NOTES
#     Main Repository: <https://github.com/rzjnzk/unix-home-dir>

tput init

mkdir -vp \
    "${HOME}/.profile.hosts.d"
    "${HOME}/bin"

PATH="${PATH}:${HOME}/bin"
export PATH

chmod u+rwx "${HOME}"/bin/*

export GPG_TTY="$(tty)"

eval "$(cat "${HOME}/.env" | sed "s/^.*$/export &/g")"

if
    test -f "/mnt/c/Windows/System32/cmd.exe"
then
    tput setaf 4
    printf -- "\`${SHELL}\` appears to be running under Windows Subsystem for Linux (WSL).\n"
    printf -- "Importing Windows environment variables with the prefix \`WSL_\`.\n\n"
    tput sgr0

    # TODO: Substitiute `C:\` as `/mnt/c`. Where `C` is any english alphabet letter.
    eval \
        "$(
            /mnt/c/Windows/System32/cmd.exe /c SET |
                sed -n \
                    "
                        # Remove carriage return.
                        s/\r//g;

                        # Remove illegal POSIX-compliant variable name chars.
                        s/^.*[()].*=.*$//g;

                        # # Convert windows path prefixes to WSL format.
                        # s/\(^..*=.*\)[A-Z]:\\\\/\1\//g;

                        # Assume backslashes are path dividers and substitute POSIX forward slashes.
                        s/\\\\/\//g;

                        # Prepare for execution.
                        s/\(^..*=\)\(.*$\)/export WSL_\1\"\2\"/g;

                        p
                    "
        )"
fi

# TODO: Check this logic.
test "${debian_chroot:-}" ||
    test -r /etc/debian_chroot &&
        debian_chroot="$(cat /etc/debian_chroot)"

PS1_PROMPT_FUNCTION()
{
    _pre_prompt_exit_code="${?}"

    # 'Previous output no-newline' fix with additional newline.
    printf -- "%$(($(tput cols)-1))s\r\n"

    tput rev
    test "${SSH_CLIENT}" && printf -- "${SSH_CLIENT} ="
    printf "%s" \
        " ${debian_chroot:+($debian_chroot)}" \
        "$(whoami)@$(hostname) $(tput sgr0) " \
        "$(tput rev) $(date "+%H:%M:%S") $(tput sgr0) " \
        "$(tput rev) $(date "+%d/%m/%Y") $(tput sgr0) "
    test "${_pre_prompt_exit_code}" = "0" && tput setaf 2 || tput setaf 1
    printf -- "$(tput rev) ${_pre_prompt_exit_code} $(tput sgr0) >\n"

    # Current working directory.
    tput setaf 5
    printf -- "\xe2\x94\x9c\xe2\x94\x80\xe2\x94\x80 "
    pwd

    # If dir is under git version control.
    # TODO: Prevent error output in non-git dir tree.
    if
        test -d "./.git"
    then
        # TODO: Print information on changes since last commit.
        # _git_log_data="$(git log -1 --format="" --summary)"
        printf -- "\xe2\x94\x94\xe2\x94\x80\xe2\x94\x80 "
        git config --get remote.origin.url
        # git log -1 --oneline --decorate=full --color=always | sed "s/).*$/)/g"
    fi

    tput sgr0
    printf -- "\n${SHELL} \$ "
}

PS1="\$(PS1_PROMPT_FUNCTION)"

export MAKEFLAGS="$(
    printf -- "${MAKEFLAGS} "
    lscpu |
        sed -n \
            "
                /^CPU(s): *.*\$/ \
                {
                    s/^CPU(s): * \(.*\)\$/-j \1/
                    p
                }
            "
    )"

export GNUMAKEFLAGS="${MAKEFLAGS}"

# BEGIN Sourcing shell-specific *rc scripts.
if
    test -f "${HOME}/.bashrc" &&
        test "${SHELL}" = "/bin/bash"
then
    . "${HOME}/.bashrc"
elif
    test -f "${HOME}/.cshrc" &&
        test "${SHELL}" = "/bin/csh"
then
    . "${HOME}/.cshrc"
fi
# END Sourcing shell-specific *rc scripts.

# BEGIN Sourcing host-specific scripts.
if
    test -f "${HOME}/.profile.d/host-profiles/$(hostname)"
then
    tput setaf 2
    _command=". \"${HOME}/.profile.d/host-profiles/$(hostname)\""
    printf -- "Sourcing existing file for this hostname.\n+ ${_command}\n"
    eval "${_command}" ||
        {
            tput setaf 1
            printf -- "Failed to source existing shell script for this hostname.\n"
        }
else
    tput setaf 1
    printf -- "Creating shell script for this hostname.\n+ ${_command}\n"
    cp -vf "${HOME}/.profile.d/host-profiles.template.txt" "${HOME}/.profile.d/host-profiles/$(hostname)"
fi
tput sgr0
# END Sourcing host-specific scripts.
