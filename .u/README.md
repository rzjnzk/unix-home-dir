# `u`

- [What is `u`?](#what-is-u)
- [Setup a new `u` repository](#setup-a-new-u-repository)

## What is `u`?

`u` is a git-based user and system file management tool that aims to be able to run on any Unix-like environment.

- Setup any Unix-like system exactly the way you want in a fully-automated way with a single command that can be memorised.
- Sync changes across any Unix-like systems.
- Backup, rollback, and recover any user and system files you decide to track.
- Easily share user and system configurations with others.
- Quickly and easily access your user scripts and other utilities on any Unix-like system.
- Optionally add multiple remotes to push and pull from independently.

The only assumption `u` makes is that `/bin/sh` exists. Even the existence of `git` is not assumed: if `git` it is not present, `u` will help you install it gracefully.

The name `u` has not set meaning, it could mean user, unix, unified, utils, micro, or anything else that makes sense to you.

---

## Setup a new `u` repository


```sh
wget -O- https://raw.githubusercontent.com/rzjnzk/u/master/libexec/bin/u | sh -s -- init
```

or

```sh
curl -L https://raw.githubusercontent.com/rzjnzk/u/master/libexec/bin/u | sh -s -- init
```
