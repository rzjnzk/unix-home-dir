#!/bin/sh

_script_name="$(basename -- "${0}")"
_script_path="$(cd -- "$(dirname -- "${0}")" && pwd)"

(
    mkdir -p -- "${_script_path}/${_script_name}-logs"
    _log_file="${_script_path}/${_script_name}-logs/$(date --utc +%Y-%m-%d_%H-%M-%S)_UTC.log"

    _log_start()
    {
        # Save original stdout and stderr file descriptors
        exec 3>&1 4>&2

        # Redirect `stdout` and `stderr` to the log file, while preserving the output display in the terminal.
        exec >"${_log_file}" 2>&1

        tail -f "${_log_file}" & _pid_tail="${!}"
    }

    _log_stop()
    {
        # Restore original `stdout`` and `stderr`.
        exec 1>&3 2>&4

        # Kill the tail process if running.
        if 
            test -n "${_pid_tail}"
        then
            kill "${_pid_tail}" 2>/dev/null
        fi
    }

    _log_message()
    {
        printf "%s\n" "[$(date --utc +%Y-%m-%d_%H-%M-%S)_UTC] ${1}" >> "${_log_file}"
    }
)
