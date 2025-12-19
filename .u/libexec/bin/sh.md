```sh
# dir = "${U_DIR}/opt/custom_name_here"
# is_use_git = true
# is_overlay_files = false
# visibility = public
# is_encrypted = false
# commit_hash = a8f4e2c1d9b7e6f3c2a1b0d4e5f6a7b8c9d0e1f2
# pull = http://github.com/USER_NAME_HERE/REPO_NAME_HERE remote-branch:local-branch
# push = http://github.com/USER_NAME_HERE/REPO_NAME_HERE local-branch:remote-branch

# Create the target directory if it doesn't exist (does nothing if it already exists).
mkdir -p -- "${_remote_conf_value__dir}"

# Change into the target directory (all further git commands operate here).
cd "${_remote_conf_value__dir}"

# Initialize an empty Git repository in the current directory.
git init

# Add a remote named 'origin-pull' pointing to the specified repository URL.
git remote add origin-pull "${_remote_conf_value__pull__url}"

# Fetch the specified remote branch from 'origin-pull' and update/create the local branch.
# This does NOT check out the branch or any files yet.
git fetch origin-pull "${_remote_conf_value__pull__remote_branch}:${_remote_conf_value__pull__local_branch}"

# If a specific commit hash is provided...
if test -n "${_remote_conf_value__commit_hash}"; then
    # ...create and check out a new local branch at that specific commit.
    git checkout -b "${_remote_conf_value__pull__local_branch}" "${_remote_conf_value__commit_hash}"
else
    # ...otherwise, create and check out a new local branch at the tip of the fetched remote branch.
    git checkout -b "${_remote_conf_value__pull__local_branch}" "origin-pull/${_remote_conf_value__pull__remote_branch}"
fi
```
Great question! Here’s a comparison:

---

### **1. `git fetch origin remote_branch:local_branch`**

- **What it does:**
  Fetches `remote_branch` from `origin` and updates/creates `local_branch` to point to it.
- **Pros:**
  - Efficient: Only fetches and updates the branch, does not switch your working directory.
  - Works in all versions of Git.
- **Cons:**
  - Does **not** check out the branch; you must run `git checkout local_branch` if you want to switch to it.

---

### **2. `git checkout -b local_branch commit_hash`**

- **What it does:**
  Creates a new branch `local_branch` at `commit_hash` and checks it out.
- **Pros:**
  - Immediately switches your working directory to the new branch at the specific commit.
  - Works in all versions of Git.
- **Cons:**
  - Requires you to know the commit hash.
  - Does not fetch anything; you must fetch first if the commit is not present locally.

---

### **Portability**

Both approaches are **portable** and work with very old versions of Git (1.5+).

---

### **Key Differences**

- `git fetch origin remote_branch:local_branch` **updates/creates the branch** but does **not check it out**.
- `git checkout -b local_branch commit_hash` **creates and checks out** the branch at a specific commit, but you must fetch first if needed.

---

### **Which should you use?**

- If you want to **fetch and update a local branch to match a remote branch** (but not switch to it), use:
  ```sh
  git fetch origin remote_branch:local_branch
  ```
- If you want to **create and switch to a branch at a specific commit** (after fetching), use:
  ```sh
  git checkout -b local_branch commit_hash
  ```

**Often, you’ll use both:**
1. Fetch the branch (and commit) you want:
   ```sh
   git fetch origin remote_branch
   ```
2. Then check out the commit to a new branch:
   ```sh
   git checkout -b local_branch commit_hash
   ```

---

**Summary:**
- Both are portable and safe.
- Use `git fetch ...:...` to update/create a branch without switching.
- Use `git checkout -b ... ...` to create and switch to a branch at a specific commit.
- Combine them as needed for your workflow.
---
---
---
### **For Pulling:**

You can fetch a remote branch and update a different local branch using:

```sh
git fetch origin remote-branch:local-branch
```

- This fetches `origin/remote-branch` and updates (or creates) `local-branch` in your local repo.

**Example:**
```sh
git fetch origin feature-remote:feature-local
```
This will fetch `origin/feature-remote` and update/create `feature-local` locally.

---

**Note:**
- `git pull` does not support the colon syntax directly.
- To update your working tree after `git fetch`, you can check out the local branch:
  ```sh
  git checkout feature-local
  ```

---

**Summary:**
- `git push origin local:remote` — push local branch to remote branch.
- `git fetch origin remote:local` — fetch remote branch to local branch.
- `git pull` is a combination of `fetch` and `merge` and does not use the colon syntax.

---

Here’s how you can achieve each of your requirements in a script-friendly way:

---

## **1. For an existing local repo**

### **A. Checkout remote branch `foo` as local branch `bar` at a specific commit hash**

```sh
cd /path/to/local/repo

# Fetch the remote branch and all its commits
git fetch origin foo

# Create or update local branch 'bar' at the specific commit
git checkout -B bar <commit-hash>
```
- `-B` creates or resets `bar` to `<commit-hash>`.
- Untracked files in the repo **will not be overwritten** by `git checkout` (only tracked files are affected).

---

### **B. Checkout remote branch `foo` as local branch `bar` at the latest commit**

```sh
cd /path/to/local/repo

git fetch origin foo
git checkout -B bar origin/foo
```
- This sets `bar` to the tip of `origin/foo`.

---

## **2. For a repo that does NOT exist locally**

### **A. Clone the repo into a specific directory (without overwriting untracked files)**

If the directory does **not exist**:
```sh
git clone --branch foo --single-branch <repo-url> /path/to/local/repo
cd /path/to/local/repo

# For a specific commit:
git checkout -B bar <commit-hash>
```
- This clones only branch `foo`, then creates/resets `bar` at `<commit-hash>`.

If the directory **exists and is not a git repo** (and may have untracked files):
- You cannot safely clone into a non-empty directory unless you use `git init` and set up remotes manually:

```sh
cd /path/to/local/repo
git init
git remote add origin <repo-url>
git fetch origin foo

# For latest commit:
git checkout -B bar origin/foo

# For specific commit:
git checkout -B bar <commit-hash>
```
- Untracked files will remain untouched.

---

## **3. Notes on Untracked Files**
- **Untracked files are never overwritten** by `git checkout` or `git clone`. Only files tracked by Git and changed between branches/commits may be overwritten.
- If you have **uncommitted changes to tracked files**, `git checkout` may refuse to switch branches unless you use `-f` (force), which can discard changes.

---

## **4. Script Example (Handles Both Cases)**

```sh
#!/bin/bash
set -e

REPO_URL="https://example.com/repo.git"
REMOTE_BRANCH="foo"
LOCAL_BRANCH="bar"
COMMIT_HASH="abcdef1234567890"
LOCAL_DIR="/path/to/local/repo"

if [ ! -d "$LOCAL_DIR/.git" ]; then
    # Directory does not exist or is not a git repo
    mkdir -p "$LOCAL_DIR"
    cd "$LOCAL_DIR"
    git init
    git remote add origin "$REPO_URL"
    git fetch origin "$REMOTE_BRANCH"
else
    cd "$LOCAL_DIR"
    git fetch origin "$REMOTE_BRANCH"
fi

# For latest commit:
# git checkout -B "$LOCAL_BRANCH" "origin/$REMOTE_BRANCH"

# For specific commit:
git checkout -B "$LOCAL_BRANCH" "$COMMIT_HASH"
```

---

## **Summary Table**

| Scenario                | Command(s)                                                                 |
|-------------------------|----------------------------------------------------------------------------|
| Existing repo, latest   | `git fetch origin foo`<br>`git checkout -B bar origin/foo`                 |
| Existing repo, commit   | `git fetch origin foo`<br>`git checkout -B bar <commit-hash>`              |
| New repo, latest        | `git clone --branch foo --single-branch <url> <dir>`<br>`git checkout -B bar origin/foo` |
| New repo, commit        | `git clone --branch foo --single-branch <url> <dir>`<br>`git checkout -B bar <commit-hash>` |

---

**Untracked files in the local directory will not be overwritten by these operations.**
If you want to ensure you never overwrite untracked files, avoid using `-f` with `git checkout`.

---

Git does **not natively support** checking out only a subset of files based on a .gitignore file. However, you can achieve this effect using a combination of Git and other tools:

---

## **Method 1: Sparse Checkout (Recommended for Subsets)**

You can use Git’s **sparse-checkout** feature to check out only specific files or directories. However, sparse-checkout uses its own patterns, not .gitignore directly.
To use your .gitignore as a basis, you’d need to convert its “not ignored” patterns into sparse-checkout patterns.

### **Steps:**

1. **Clone the repo without checking out files:**
   ```sh
   git clone --no-checkout <repo-url> myrepo
   cd myrepo
   ```

2. **Enable sparse-checkout:**
   ```sh
   git sparse-checkout init --cone
   ```

3. **Set the sparse-checkout patterns:**
   - You need to list the files/directories you want to include (i.e., those **not** ignored by your special .gitignore).
   - You can generate this list with:
     ```sh
     git ls-tree -r --name-only HEAD | grep -v -f .gitignore > sparse-list.txt
     ```
     *(This is a simplification; .gitignore patterns are more complex than simple grep, so for complex ignores, use a tool like [gitignore-parser](https://github.com/s0undt3ch/gitignore_parser) or [fd](https://github.com/sharkdp/fd) with `--ignore-file`.)*

   - Then, set the sparse-checkout file:
     ```sh
     cat sparse-list.txt > .git/info/sparse-checkout
     ```

4. **Checkout the files:**
   ```sh
   git checkout
   ```
