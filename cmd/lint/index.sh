#!/bin/sh

_linter_option="${1}"
shift

case "${_linter_option}"
in
	"posix" )
		# -x   
		# sh implies linting for a posix compliant shell
		# SC2059 corresponds to 
		# SC1090 corresponds to 
		shellcheck -x --shell=sh --exclude=SC2059,SC1090 ${@}
	;;
esac
