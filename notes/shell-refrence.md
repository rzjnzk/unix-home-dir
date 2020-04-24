command > FILE_NAME_HERE 2>&1

## Create a file containing random data

```sh
    # TODO: Verify this is posix.
    dd if=/dev/urandom of=output.txt bs=1K count=1000
    dd bs=1K count=1000 < /dev/urandom > output.txt 2>&1
```
bs=64M count=16

## Special paths

/dev/null
/dev/random
/dev/urandom
/dev/zero
