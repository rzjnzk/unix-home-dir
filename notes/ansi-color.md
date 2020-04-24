https://linux.die.net/man/5/dir_colors

ISO 6429 (ANSI) color sequences

 0     to restore default color
 1     for brighter colors
 4     for underlined text
 5     for flashing text
30     for black foreground
31     for red foreground
32     for green foreground
33     for yellow (or brown) foreground
34     for blue foreground
35     for purple foreground
36     for cyan foreground
37     for white (or gray) foreground
40     for black background
41     for red background
42     for green background
43     for yellow (or brown) background
44     for blue background
45     for purple background
46     for cyan background
47     for white (or gray) background
Not all commands will work on all systems or display devices.

ls uses the following defaults:

NORMAL   0       Normal (nonfilename) text
FILE     0       Regular file
DIR      32      Directory
LINK     36      Symbolic link
ORPHAN   undefined       Orphaned symbolic link
MISSING  undefined       Missing file
FIFO     31      Named pipe (FIFO)
SOCK     33      Socket
BLK      44;37   Block device
CHR      44;37   Character device
EXEC     35      Executable file
