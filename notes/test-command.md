# Example usages
## Notes

End of options builtin `--` not supported in atleast some cases.

## Conditions

```sh
    test "${_str1}" = "${_str2}"
    test "${_str1}" != "${_str2}"

    test "${_int1}" -operator "${_int2}"
    # Where `-operator' is:
    #     -eq [=];
    #     -ne [!=];
    #     -ge [>=];
    #     -gt [>];
    #     -le [<=];
    #     -lt [<].


    test -n "${_str}" # the length of `_str`  is nonzero
    test -z "${_str}" # the length of `_str` is zero

```

## Usages

```sh
    test -n "${_something}" && # or ||
        {
            multiple
            commands
            here
        }
```
