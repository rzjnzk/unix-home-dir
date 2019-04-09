#!/bin/bash

# SHH aliases
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
	case "${1}"
	in
		"uni")
			echo "Executing \"ssh -X a1731824@uss.cs.adelaide.edu.au\""
			ssh -X a1731824@uss.cs.adelaide.edu.au
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
