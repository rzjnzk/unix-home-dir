#!/bin/bash

# Build automation script
# Author: Robert Z. J. Norris-Karr (https://github.com/rzjnzk)

# ---------
# functions
# ---------

function func_loop_exec # (relative_file_name)
{
	local _userInput=""

    #while [ 1 ]
    #do
		echo "Executing \"${1}\""

		${1}

		#read -p "Run again? (Y/n)" _userInput

		#if [ "${_userInput}" = "n" ] || [ "${_userInput}" = "N" ]
		#then
		#	break;
		#fi

		#test $? -gt 128 && break; # break on  ctrl^c
    #dne
}

function func_ws
{
	echo "Executing \"g++ -o main.out -O2 -Wall *.cpp\""
	g++ -o main.out -O2 -Wall *.cpp || return
    func_loop_exec "./main.out"
}

function func_verb
{
	echo "Executing \"g++ -o main.out -O2 -pedantic -Wall -Wextra -fsanitize=address *.cpp\""
	g++ -O2 -pedantic -Wall -Wextra -fsanitize=address *.cpp || return
	# removed -g flag (gdb) as conflicts with leak sanitiser
	func_loop_exec "./a.out"
}

function func_gdb
{
    echo "Executing \"g++ -o main.out -O2 -pedantic -Wall -Wextra -fsanitize=address *.cpp\""
	g++ -O2 -pedantic -Wall -Wextra -g *.cpp || return
    func_loop_exec "./a.out"
}

# -------------
# main function
# -------------

function func_main
{
    case "${1}"
	in
		"ws")
			func_ws
			;;

		"verb")
			func_verb
			;;

		"gdb")
			func_gdb
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
