# `unix-home-dir`

---

## Installation

```sh
wget https://raw.githubusercontent.com/rzjnzk/unix-home-dir/master/home -O ~/home && sh ~/home install
```

or

```sh
curl https://raw.githubusercontent.com/rzjnzk/unix-home-dir/master/home -o ~/home && sh ~/home install
```

---

## Directory Structure

```txt
.bash_logout
.bash_profile
.bashrc
.cache
.clang-format
.config
.emacs.d
.env
.git
.gitattributes
.gitconfig
.gitconfig.user.d
.githooks
.gitignore
.gitmodules
.gnupg
.java
.lesshst
.local
.netrc
.npm
.pki
.profile
.profile.hosts.d
.profile.old
.ssh
.subversion
.sudo_as_admin_successful
.vim
.viminfo
.vimrc
README.md
bin
check.raw.txt
cmd
home
lib
libs-bin
libs-src
reference
tmp
```

---

## TODO

- Move all scripts under `~/cmd` to `~/bin`, and alter the PATH variable.
- Consider the management of dependencies, and script or binary data files.
- Create a `~/libs` or `~/lib` dir in which to place my own libraries; shell or otherwise.
    - Consider including libs in the `~/bin` dir, for example, `name.lib.sh`, though this might result in the script being executable.
    - Consider `~/bin/lib` or `~/bin/libs`. Research whether a PATH dir extends to int's child dirs.
- On profile execution notify the user if any commands in `~/bin` conflict with existing commands.
    - Consider what to do with this knowlege.
- Consider flag termination `--` as to prevent edge cases and unexpected behaviour arising from string variable interpolation.
- Prepare gpg encryption script/repo for public release.
    - Write a README containing ...
        - simple instructions, and;
        - accurate explanations with;
        - example use cases, mentioning how it is used in my unix-home-dir repo, also;
        - mention what it does better than alternatives.
    - Settle on a name.
    - Figure out final repo structure.
    - Create a public Github repo contining a working ready-to-use version, or add a WIP notice.
        - Make sure personal data and configurations are removed.
    - Settle on final core user command syntax so the release can be updated gently.
    - Consider whether encrypting seperated script snippets could increase security by obfuscation.
    - Consider other potential methods of encryption method obsfucation, rather, information hiding, possibly via encryption.
    - Look for any weak points and security flaws and deal with them.
    - Consider the effect of git history and information retention---both on the server and locally---on security. Especially in handling the deleting or shredding of data there need
