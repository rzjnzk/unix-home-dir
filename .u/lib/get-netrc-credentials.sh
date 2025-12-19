#!/bin/sh

_lib__get_netrc_credentials()
{
    if
        test -f "${HOME}/.netrc"
    then
        # TODO: There might be tab characters after a key such as `machine`, but the most portable way would be to hardcode a literal tab character.
        # shellcheck disable=SC2312
        sed -n \
        "
            /^machine  *$(printf "%s" "${@}" | sed "s/./\\./")$/ \
            {
                :loop;
                n;
                /^machine  */q;

                /^login/ \
                {
                    s/^ *login  *//;
                    h;
                }

                /^password/ \
                {
                    s/^ *password  *//;
                    H;
                    g;
                    s/\n/,/;
                    p;
                    q;
                }

                b loop;
            }
        " \
        "${HOME}/.netrc"
    fi
}

# _lib__get_netrc() {
#     machine="$1"
#     file="${HOME}/.netrc"

#     sed -n "
#         /^machine[ \t]*$machine\$/,/^machine /{
#             /^login[ \t]*/{
#                 s///;h
#                 n
#             }
#             /^password[ \t]*/{
#                 s///;H
#                 n
#             }
#             /^account[ \t]*/{
#                 s///;H
#                 n
#             }
#         }
#         \${
#             g
#             s/\n/,/g
#             s/^\(.*\)$/\1/
#             # Ensure always two commas
#             s/^\([^,]*\)\(,[^,]*\)\{0,2\}$/&,/
#             s/^\([^,]*,[^,]*\)\(,[^,]*\)\{0,1\}$/&,/
#             p
#         }
#     " "$file"
# }