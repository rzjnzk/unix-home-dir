#!/bin/sh

_lib__supports_function_args()
{
    (
        _a()
        {
            _count_a="${#}"
        }

        _b()
        {
            _count_b="${#}"
        }

        _a 0
        _b 0 0

        ! test "${_count_a}" = "${_count_b}"
    )
}
