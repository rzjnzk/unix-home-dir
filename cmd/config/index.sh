#!/bin/bash

# Bash home configuration managment
# Author: Robert Z. J. Norris-Karr (https://github.com/rzjnzk)

# ---------
# functions
# ---------

# none

# -------------
# main function
# -------------

function func_main
{
	local current_dir="$(pwd)"

	case "$1"
	in
		"up")
			if [ "$2" = "dev" ]
			then
				cd "${DIR_PREFIX_DEV}"

			else
				cd ~
			fi

			git add --all || return
			git commit -m "$(date +%s)" || return
			git push origin master
			;;

		"down")
			if [ "$2" = "dev" ]
			then
				cd "${DIR_PREFIX_DEV}"
				git clone https://github.com/rzjnzk/personal-sh-home-dir.git
			else
				cd ~
				git clone -b master https://github.com/rzjnzk/personal-sh-home-dir.git .
			fi
			;;
	esac

	cd ${current_dir}
}

# -----------------
# initialise script
# -----------------

script_name="$(basename "${BASH_SOURCE[0]}")"
absolute_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#cd "${absolute_path}"
func_main "$@"
