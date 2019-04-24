# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# beginning indication
printf "Beginning execution of \"${HOME}/.profile\"\n\n"

# print shell version and license information
#printf "$(${SHELL} --version)\n\n"

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# only the current user can read write and execute files and dirs created by them
# TODO: may stall here, possibly dependant on users permissions
#umask 002

# set permissions
chmod u+rwx -R "${HOME}"
chmod 600 "${HOME}/.ssh/config"

# set the display for x-server use with non-gui environments such as WSL
export DISPLAY=:0

# # TODO: may cause the terminla to hang
# # force man to print
# function man
# {
#     man -P cat ${@}
# }

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]
then
    PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${HOME}/.local/bin" ]
then
    PATH="${HOME}/.local/bin:${PATH}"
fi

# if running bash, source the users .bashrc
if [ -n "${BASH_VERSION}" ]
then
    # source .bashrc if it exists
    if [ -f "${HOME}/.bashrc" ]
    then
	. "${HOME}/.bashrc"
    fi
fi

# finishing indication
printf "Finishing execution of \"${HOME}/.profile\"\n\n"
