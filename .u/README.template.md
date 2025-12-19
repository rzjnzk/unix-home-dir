# `u`

- [What is `u`?](#what-is-u)
- [Setup a new `u` repository](#setup-a-new-u-repository)
- [Install this `u` repository](#install-this-u-repository)
- [Execute a script without installing `u`](#execute-a-script-without-installing-u)

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

Base repository: <https://github.com/rzjnzk/u>.

---

## Setup a new `u` repository


```sh
wget -O- https://raw.githubusercontent.com/rzjnzk/u/master/u | sh -s -- setup
```

or

```sh
curl -L https://raw.githubusercontent.com/rzjnzk/u/master/u | sh -s -- setup
```

---

## Install this `u` repository

```sh
wget -O- https://raw.githubusercontent.com/{{USERNAME}}/{{REPOSITORY_NAME}}/master/u | sh -s -- i
```

or

```sh
curl -L https://raw.githubusercontent.com/{{USERNAME}}/{{REPOSITORY_NAME}}/master/u | sh -s -- i
```

---

## Execute a script without installing `u`

When executing a script without installing `u` no scripts are written to the filesystem and the system is not modified any way unless intended by the executed script.

Print the help message to see a list of all available scripts:

```sh
wget -O- https://raw.githubusercontent.com/{{USERNAME}}/{{REPOSITORY_NAME}}/master/u | sh -s
```

or

```sh
curl -L https://raw.githubusercontent.com/{{USERNAME}}/{{REPOSITORY_NAME}}/master/u | sh -s
```

Execute a script without installing `u` with the following command structure:

```sh
wget -O- https://raw.githubusercontent.com/{{USERNAME}}/{{REPOSITORY_NAME}}/master/u | sh -s -- e <SELECTED_SCRIPT> <ARG_1> <ARG_2> <ARG_N>
```

or

```sh
curl -L https://raw.githubusercontent.com/{{USERNAME}}/{{REPOSITORY_NAME}}/master/u | sh -s -- e <SELECTED_SCRIPT> <ARG_1> <ARG_2> <ARG_N>
```

---

