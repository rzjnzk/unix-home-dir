#!/bin/bash

# A loose image file cleaner for Windows Subsystem for Linux
# Author: Robert Z. J. Norris-Karr (https://github.com/rzjnzk)

# ---------
# functions
# ---------



# -------------
# main function
# -------------

function func_main
{
    # specify image extensions
    local _extensions=( \
        "jpg" \
        "JPG" \
        "jpeg" \
        "JPEG" \
        "png" \
        "PNG" \
        "bmp" \
        "BMP" \
        "webp" \
        "WEBP" \
        "gif" \
        "GIF" \
        "webm" \
        "WEBM" \
        "mp4" \
        "MP4" \
        "avi" \
        "AVI" \
    )

    # specify source directories containing image files to be moved
    local _source_dirs=( \
        "/mnt/c/Users/User/Downloads" \
        "/mnt/c/Users/User/Desktop" \
    )

    # specify and make target dir
    local _target_dir="E:/d/User/E (Master)"
    sudo mkdir -p "${_target_dir}"

    echo "Begin sorting."

    # loop source dirs and image extensions, moving each selection to the target dir
    for source_dir in "${_source_dirs[@]}"; do
        for extension in "${_extensions[@]}"; do
            echo "Moving ${extension} files from ${source_dir}/ to ${_target_dir}."
	    sudo mv --no-clobber "${source_dir}/"*.${extension} "${_target_dir}" || \
		    echo "Error occured, likely no ${extension} files found."
            #mv /mnt/c/Users/User/Downloads/*.jpg /mnt/c/Users/User/Pictures/win-img-clean/
        done
    done

    echo "End sorting."
}

# -----------------
# initialise script
# -----------------

var_script_name="$(basename "${BASH_SOURCE[0]}")"
var_absolute_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#cd "${var_absolute_path}"
func_main "$@"
