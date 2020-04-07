# NAME
#     .bash_logout
#
# DESCRIPTION
#     The `~/.bash_logout` script is executed by bash for non-login shells on exit.
#
# AUTHORS
#     Copyright (c) Robert Zack Jaidyn Norris-Karr <rzjnzk@gmail.com> <https://github.com/rzjnzk>
#
# NOTES
#     Main Repository: <https://github.com/rzjnzk/unix-home-dir>

# When leaving the console clear the screen to increase privacy.
if
    test "${SHLVL}" = 1 &&
        test -x /usr/bin/clear_console
then
    /usr/bin/clear_console -q
fi
