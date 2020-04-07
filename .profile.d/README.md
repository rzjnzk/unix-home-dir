# Directory Description

This directory is searched for files matching the output of `hostname` appended by `.sh`. If such a file is found, then that file is sourced. This allows for organised machine-specific run command scripts.

In the case that the hostname is identical between machines, currently additional conditions should be added in the corresponding hostname file. [TODO: Consider alternatives].
