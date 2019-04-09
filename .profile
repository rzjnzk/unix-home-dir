# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

printf "Executing \"${home}/.profile\"\n\n"
printf "$(${SHELL} --version)\n\n"

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# only the current user can read write and execute files and dirs created by them
umask 002

chmod u+rwx -R ~

# if running bash
if [ -n "$BASH_VERSION" ]
then
    # source .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]
    then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]
then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]
then
    PATH="$HOME/.local/bin:$PATH"
fi
