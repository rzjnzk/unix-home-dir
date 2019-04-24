#!/bin/bash

# Test script
# Author: Robert Z. J. Norris-Karr (https://github.com/rzjnzk)

# ---------
# functions
# ---------

function _setup_system
{
	sudo apt-get install curl
	curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
	sudo apt-get install nodejs
}

# -------------
# main function
# -------------

function func_main
{
    case "${1}"
    in
        "install")
            cd
            git clone https://github.com/rzjnzk/personal-sh-home-dir.git ~/personal-sh-home-dir || \
                git pull origin master ~/personal-sh-home-dir
            . ~/personal-sh-home-dir/INSTALL.sh
            ;;

        "update-uni")
            scp ~/.bashrc a1731824@uss.cs.adelaide.edu.au:~/
            scp ~/.profile a1731824@uss.cs.adelaide.edu.au:~/
            scp ~/.profile a1731824@uss.cs.adelaide.edu.au:~/
            scp -r ~/cmd/ a1731824@uss.cs.adelaide.edu.au:/users/4/a1731824/bar/
            ;;
    esac
}

# -----------------
# initialise script
# -----------------

script_name="$(basename "${BASH_SOURCE[0]}")"
absolute_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#cd "${absolute_path}"
func_main "$@"
