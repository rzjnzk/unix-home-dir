#!/bin/bash

# Test script
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
    echo "Testing ..."
}

# -----------------
# initialise script
# -----------------

script_name="$(basename "${BASH_SOURCE[0]}")"
absolute_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#cd "${absolute_path}"
func_main "$@"
