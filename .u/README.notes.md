# TODO and Ideas

- Consider removeing `Directory Structure` from the `README.md` file as it is described by the `.gitignore` file.
- License option 1: Add a license that permits personal use, but not redistribution, whether modified or not, and not for commercial use. The user should be able to use my code and modify it for personal use, but should not be able to use any of my code in their own projects, whether the code is modified or not, and whether the project is commercial or not. Provided with no liability.
- License option 2: Add a license that permits personal use, but, if redistributed and not being used for monetary gain or proprietary software: original repository link, copyright notice, and owner information must not be removed; if only part of the code is used, wether modified or not, said information must be included, clearly indicating the code it applies to, and must be included in any about section when used in projects with GUIs, and in a help command on initial input if used in a cli project. If someone desires to use it for a project that will result in monetary gain or is proprietary, the owner must be contacted beforehand to negotiate terms of usage, which could mean any combination of the following: notice of the original repository link, copyright notice, and owner information to the end user in a specified way, such as in the about section, help command, or other notice such as a notice that displays only on the first use of the application by the user, or every use of the application. Provided with no liability.
- License considerations:
    - Prevent monetary gain loopholes
    - Consider license restrictions imposed by third-party code that is used in the project.
    - Clearly displayed credit via link to the original repository, copyright notice, and owner information as well as any other credit information including code used credited to someone other than the owner.
        - Prevent the removal of commented credit information, and require a respective files commented credit information be copied along with and code extracted from a file, whether modified or not, and be pasted where the code is used, clearly indicating the beginning and ending of the copyrighted code.
        - [Duplicate? Combine? #3] Prevent the removal of credit information in the about section, help command, or other notice such as a notice that displays only on the first use of the application by the user, or every use of the application.
        - [Duplicate? Combine? #2] Prevent the removal of credit information in the GUI or CLI, and require that the credit information be displayed in a specified way, such as in the about section, help command, or other notice such as a notice that displays only on the first use of the application by the user, or every use of the application.
        - Prevent the removal of directory or project scoped credit information.
        - Prevent the removal of the license, and perhaps require that it is clearly specified what code the license applies to to prevent conflict with other licenses. Consider for the license would affect licenses in projects that use the code, and how to prevent conflicts.
    - Permitted usage options:
        - Simply put, always require credit in comments and files and user interface, the license, and, either allow all usage, or all usage without monetary gain with a requirement of negotiation of terms of use if used for monetary gain.
        - Must retain unmodified: credit information, in comments and files and displayed to the end user; and, the original license with clear specification as to what code the license applies to, and clearly indicate that any other licenses do not apply to the used code.
            - 1. Any usage, whether monetary gain or not, Commercial or non-commercial, proprietary or non-proprietary, open-source or closed-source.
            - 2. Any usage if there is no monetary gain, or if there is monetary gain, the owner must be contacted to negotiate terms of usage.
        - This should apply to anyone that uses the code whether it is sourced directly from the original repository, or from a project that uses the code, or any other location where any part of the code is available. This should propagate infinitely, for example, in repository fork chains.

- Move all scripts under `~/cmd` to `~/bin`, and alter the PATH variable.
- Consider the management of dependencies, and script or binary data files.
- Create a `~/libs` or `~/lib` dir in which to place my own libraries; shell or otherwise.
    - Consider including libs in the `~/bin` dir, for example, `name.lib.sh`, though this might result in the script being executable.
    - Consider `~/bin/lib` or `~/bin/libs`. Research whether a PATH dir extends to int's child dirs.
- On profile execution notify the user if any commands in `~/bin` conflict with existing commands.
    - Consider what to do with this knowledge.
- Consider flag termination `--` as to prevent edge cases and unexpected behavior arising from string variable interpolation.
- Prepare gpg encryption script/repo for public release.
    - Write a README containing ...
        - simple instructions, and;
        - accurate explanations with;
        - example use cases, mentioning how it is used in my unix-home-dir repo, also;
        - mention what it does better than alternatives.
    - Settle on a name.
    - Figure out final repo structure.
    - Create a public Github repo containing a working ready-to-use version, or add a WIP notice.
        - Make sure personal data and configurations are removed.
    - Settle on final core user command syntax so the release can be updated gently.
    - Consider whether encrypting separated script snippets could increase security by obfuscation.
    - Consider other potential methods of encryption method obfuscation, rather, information hiding, possibly via encryption.
    - Look for any weak points and security flaws and deal with them.
    - Consider the effect of git history and information retention---both on the server and locally---on security. Especially in handling the deleting or shredding of data there need

- Provide command to fork repository.
- Argument for `~/home` to add and remove from and to the gitignore file.
- Provide args to `~/home` that after installing the repo, installs the users own `unix-home-dir` repository while handling file conflicts.
    - There should be a template repository for people to create their own `unix-home-dir` repositories for use with mine, with file and dir names that will not conflict with those in my `unix-home-dir`, such as `~/home` and `~/README.md`, though the README might be handy as GitHub displays it, so it could be renamed during installation to prevent conflict.
        - When names conflict, either cancel the execution and notify the user, or notify the user and rename the users file. When a conflict is found, the script could safely automate changing the name to one specified by the user, and add, commit, and pushing only that file to the users repo. Notify that name changes might break functionality if used in other files.
        - Write an argument for `~/home` that will automate the process of generating a new `unix-home-dir` repository for the user.
            - Should install my home dir repo, create the users home dir repo, and it set up with a command provided have a command.
            - Could use `curl` or `wget` to interface with the GitHub API rather than `gh` to minimise dependencies.
            - The repository specified by the `.git` dir after install should be the users home dir repository so they can work with their repository and make additions, perhaps with the possibility to switch to my verison, or force the user to do that through the home script. Probably not, but the new repository link may need to be stored so `~/home` can read it.
        - Consider git hooks.
        - Include the installation command from my repository with a flag with the users home dir repo link, or a variable and instruct the user to set that variable.
    - Allow the user to override files from my repository and print a warning for those that break functionality, what functionality would be broken, and how to work around it.
    - Should be able to install multiple sets of users own `unix-home-dir` repo versions with specified order for file overrides.
    - Consider licensing and credit requirements.
- Figure out a way to handle repositories when they become to large.
- Consider alternative home script names: `home`, `h`, `home.sh`, `unix-home-dir`, `rzjnzk-unix-home-dir`, `uhd`, `homed`, `homem`, (other single character commands if home functionality is going to be increased). Consider whether it should be added to the path by storing a symlink in `~/bin` so that is works with the prospective `~/bin` script wrapper.
- Script wrapper script should output the description from the help comments of each script, and explain how to see the help comments of any given script. Consider interactivity. Consider whether new script generation should be done by this script, a script sourced by theis script, or the home file.
- Testing VMs.
    - Write a script, perhaps that is sourced by the git manager script, that can be used to, on initial run, create fullstack web-tools application testing vms with stripped back linux installs. On subsequent runs, upload or pass-through the fullstack code. The distinct vms should be: multiple browsers vm (though maybe unneeded as that can be done locally), electron application vm (multiple os), android application vm (consider phone vs tablet), and phone ios (if possible). Minimize computation time on each run via any method possible, such as possibly preventing the need to copy code and allowing access to the repository. Consider abstracting as much to allow for other project testing vms.
- Add automatic `~/bin` script wrapper script for scripts that conflict with an executable in the path or other commands such as shell built-ins, functions, and aliases. The wrapper script should also still source scripts that do not conflict with a command in the
- C and C++ compilation vs binary logic for new installs an any machine. For user C or C++ executables---such as the prospective interactive pretty printed verbose `ls`` and `cd`` replacement that `~/bin/l` is to be morphed into---the unix-home-dir installation process should either: first try to execute the downloaded compiled binary, and if it doesn't work on the machine and its architecture, then try to compile the source code into a binary in a machine-specific directory, The machine-specific directory would be similar to the machine-specific `~/.profile` sourced scripts. I could add user input to both the machine-specific profile script and executable compilation to decide what identifier to use, such as: custom name, which would be selected from user input on new installs, could describe the contents of the script, and could implement the ability to source multiple in addition to scripts for other identifiers; regular machine name from command output or env variable if available; a more specific way to identify a machine perhaps by combining information, look into mac addresses, network external ip, and machine local network unique identifier, or, ip or url that routes to some server process on the machine that is available on the internet, and thus, unique, or generate a unique code and store it in a file on the machine so that the file name can be read, and the subsequent file can be sourced each time `~/.profile` is run, this could be done by searching the directory for the highest numbered file, and creating the next one, or a name could be generated and checked against existing names could be generated; network or other types of machine grouping. Each identifier type would have its own directory to prevent naming conflicts and should have individual sourcing logic. Or, the installation process should compile the source code and then execute the compiled binary. The former is preferred as it is faster and more efficient, but the latter is more reliable and less error prone.
- Avoid committing binaries and third party source code as well as other non-source resources, instead automate the download and compilation of them.
- Panic script that shreds specified file globs. User must type `confirm` to run. Prevent unauthorised access, or accidental execution, maybe remove write permissions.
- `home` script.
    - Write protection for sub-commands, and maybe read aswell.
    - Some installation types: full (public and encrypted private code), public code only, public and partial private code, inclusive or exclusive file selection, etc.
        - Consider how it could be installed on a penetrated system without identifying the user. Code obsfuction, though since the code is unique, that may not suffice. Run obsfucated code in protected memory.
    - Consider `~/home` name conflict with other popular resources, ask copilot.
    - Have a sub-command that generates a new script with boilerplate code including help comments format, common lib source or execute lines, and common commands such as `set -e`.
        - Ability to copy other script and either insert lines from regular boilerplate, or copy with no changes, or specific changes.
        - Optional creation of sibling dir: `./script-name.d/`, with potential boilerplate files and file contents.
            - Consider how assets, especially settings, would work with one-file script extraction.
            - README.md
            - Setting.json or Setting.ini with default settings, especially settings that affect lib scripts.
            - Logging dir, though could be created dynamically by the logging lib.
        - The generated script should be automatically set to be executable, and opened in the default editor, though prefer a custom env variable, and should be linted and validated when closed.
    - Logic to generate a standalone script from `~/bin` scripts that source each other, or extract only the scripts in the sourcing chain so that only the target script and the scripts it requires are copied.
        - Consider different sets with all possible script interpreters, and sets with any combination of script interpreters.
        - Removal of unused functions, sourced or executed scripts, each optionally. Careful, these functions could be for future extensibility or used in a dependency executable.
        - Lint and validate generated scripts.
        - If possible, provide a mechanism to update the generated script using a script arg, this could interface with the script arg parser and interactive menu scripts or scripts wrapper. Or, add a comment instructing the user to go the repository link, and rerun the same install command. The `~/home` download and install command should not be added to the generated script incase it changes, instead link to the relevant section of the repository README.md.
        - Add link to `unix-home-dir` repository, and links to the specific files used in the help comments.
        - Should run without having to install `unix-home-dir`.
            - Install whole repository example: `curl https://raw.githubusercontent.com/rzjnzk/unix-home-dir/master/home -o ~/home && sh ~/home install`.
            - Install single script example: `curl https://raw.githubusercontent.com/rzjnzk/unix-home-dir/master/home -o ~/home && sh ~/home install script script-name1 script-name2 -o some/dir/file` achieve with piping instead.
                - If there is no `-o` after a given script, it should be installed in the default location and with the default name, only scripts with `-o` have custom locations and names, though consider a different flag to set the dir for all scripts. Maybe: `sh ~/home i script-def-dir-1 script-def-dir-2 -o ./some/dir script-some-dir-1 script-some-dir-2 -o ./some/dir2 script-some-dir2-1 script-some-dir2-2`, consider how script name changing would work with this, maybe `script-name@script-name-new`, or `#`, `>`, etc. The character should be a character that is illegal in file names or at least rarely used. Consider `script-name,script-name,script-name,script-name` format.
                - Or: `sh ~/home install script script-name1 script-name2 > some/dir/file`m though install is miss leading.
                - Options for: Combine into one script file; preserve script division; choose location and file name, if not provided, use the default location and script name.
    - Various install subcommands.
        - sh ~/home i
    - Arg to download script and lib scripts to stream and run it without saving.
    - Add way to separate out each `~/bin` addition to other repositories that new changes are pulled from. Either allow it on a per script basis or all scripts, or force all scripts. Consider gitmodule usage.
- `notes` script and repository.
    - Consider using obsidian. Try it first.
    - The `notes` script should have functionality to read, write, and manage the content in the `notes` repository.
    - There should be a sub command that will run `gh copilot`, or some other equally or more capable AI, with the context of only the informational parts of the `notes` repository, and allow the user to have a conversation with the AI.
    - Before reading or writing, and otherwise interacting with notes, update the local repo from the remote making sure not to overwrite any changes that are not committed, or are of a commit that is not on the remote.
        - After writing to a note, safely update the remote with the changes.
    - Add checks and handling for repository size, including division across repositories directly, using gitmodules, or some other method, and add checks for any squashing and shallow checkouts that may be required.
    - The `notes` script should have a sub command that will run `gh copilot`, or some other equally or more capable AI, with the context of only the informational parts of the `notes` repository, and allow the user to have a conversation with the AI. This could be achieved by either: running the AI with the context of the `notes` repository directory or sub directory, if required, by temporarily changing the directory; or, possibly in tandem, by automating the initial 'setup' user prompts by copying and potentially parsing the contents of each note, and adding extra instructions to the the prompts to direct future responses emphasising the importance of and requirement of the AI to remember them exactly, and give them high weight as to prefer referring to them over the AIs trained knowledge. The final automated prompt could ask for any errors or improvements on any of the notes so the user can make the changes.
    - Ability to render LaTeX, either: using a command line tool that renders all markdown aspects, including syntax highlighted code clocks, and markdown LaTeX, including equations, in pretty printed utf-8 to the console; or, to an uploaded file, perhaps using an ideally free webservice, or rendered locally and uploaded to a website that hosts images freely, ideally with the option of private vs public, and, ideally indefinitely, such as Imgur, or potentially by generating a GitHub repo with the LaTeX displayed on GitHub pages, the local rendering could simply mean opening the file with a program for viewing the markdown with LaTeX; or, a locally stored file; or, both local and uploaded file; or, if GitHubs markdown viewer supports markdown, simply provide a link below the output to console, or, if possible, provide a link to another online service for viewing LaTeX after providing it the file. Any LaTeX that is rendered to files should have a path or link printed to the console, or even the option of automatically opening the file. Either the whole document could be rendered, including the LaTeX, or only the LaTeX.
    - Ability to quickly open a note, set of notes, or directory of notes, for editing or viewing with multiple editor and viewer options, definitely editor specified by the editor env variable, nano CLI, fim CLI, emacs CLI, ideally also in vscode and GUI emacs with a markdown with LaTeX render panel and an editing panel, this way AI can easily be integrated. Other popular editors can be added later.
    - Ability to print a note or set of notes to console with clear separation and file path, and formatting or pretty printing of the output that is possible.
- SEARCH COMMAND. Have a dedicated regex search command that will print the full files with their name and location, and line locations for the search term, as well as any other important or useful info. There shoudl be that ability to use preset pattern sets, or provide cunstom ones. One preset should be a todo comment finder.
- Try to implement man pages for scripts that are used by typing `man script-name`, either using a `man` wrapper script, or creating a `man` page the usual way.
- Create a `~/bin/lib.source.d`, `~/bin/lib.execute.d/`, and `~/bin/lib.d/` or `~/bin/lib.hybrid.d/` or `~/bin/lib.source-or-execute.d/` , or create dirs using the middle section of the previous names under the `~/bin/lib.d` directory. Perhaps scripts that need or should be executed and not sourced could be combined by wrapping internally each script that is to be executed not sourced so that it runs in a sub shell when sourced if that is a perfect and full substitution for requiring such scripts to be executed, though need to consider how hybrid scripts would fit into that. The lib scripts could has the execution vs source requirment in their name, or even the fact that they are a lib in the name, so if it is okay to have them in the `~/bin` PATH directory, they could be called, for example `~/bin/lib.lib-name.execute.sh`, or `~/bin/lib.lib-name.source.sh`, or `~/bin/lib.lib-name.hybrid.sh` or `~/bin/lib.lib-name.source-or-execute.sh`. The `~/bin/lib.d` directory could be added to the PATH, or the scripts could be sourced by the `~/bin/lib` script, or the `~/bin/lib` script could be sourced by the `~/bin, Consider file extension vs no file extension, or separate directories for different interpreters, this could also apply to utils and helper libs for non-scripting languages and compiled languages, like cjs, mjs, c, cpp, and so on.
    - Other possibilities: `~/bin/lib.d/script-name.execute-method.sh`, `~/bin/lib.d/sh/script-name.execute-method`, `~/bin/lib.d/sh/execute-method/script-name`, `~/bin/lib.d/execute-method/script-name.sh`.
    - executable, source, execute, subshell, run, eval, etc.
    - Possible libs to write:
        - Arguments and interactive input. Have a wrapper script that allows providing arguments that are used by both the argument parser and interactive menu to allow the user the option between the two.
            - Complex standalone argument parser.
            - Complex standalone interactive menu script with standard sequential output.
            - Complex standalone interactive menu script with pretty printing and take terminal control and allow redrawing.
        - Polyfill command replacement or wrapper functions or lib scripts. Could have a scripts that source various common groups of each polyfill script, making scripts preferred to functions.
        - Smart logging.
        - Helper comment printer. Consider how it would work with the argument parser and interactive menu libs.
        - Script name and script dir getter.
        - Various other helper scripts.
- `rm` wrapper script that moves files to a recycle bin. This should be able to be used by any script or subshell and should function exactly the same but simply force a copy of the file(s) or dir(s) to a recycle bin directory specified by an env variable that defaults to a standard location that is used by GUI fiel exploreres or a script specific location that could be a subdirectory of that standard location. The deleted files shoudl live in a directory structure under the recycle bin that matches the absolute path of the original file to allow restoration. Either a separate restoration script, or flags that could never confilict with a scripts usage of `rm`. Alterantivly, fully replacing `rm` might be bad since when temp files are deleted by processes, the space is not cleared, unless it can be put in a directory that does no count towards the free space and can be overwritten, but then the restoration of files that you are more likely to want to restore will be impacted as they will be deleted more quickly.
- Have a second repo for development of unix-home-dir that is not ready to go public, sperate from the encrypted private directory.
- Google docs script, google sheets, slides draw, drive etc. Or sync Google drive to a dir and edit that way. Option to browser and open the file in the browser so I can see all my docs and open them in the browser so that collaborative editing is still possible, or edit in vscode or emacs with collaboration, the link being sent to selected collaborators emails.
- Consider storing private encrpted data somwhere other than a repository, maybe cloud storage, or retrieve it using ftp to my home pc, though consider measures to prevent ftp pw being exposed on foreighn mechines, maybe use a one time password somehow. Consider either mixing encrypted and non encrypted data in said location, or have a seperate location for private non-encrypted data. Consider the level of paranoia for the encyption and what is encypted, maximum paranoia dictates that it be on a machine I physically own with no chance of unauthorized access.
- AUTOMATE EDITOR INSTALLATION AND SETUP. Automate vscode and emacs setup. Ideally, with vscode, try to install a fresh version and copy all configuration or use vscode configuration handling through login, if the install can't be completed due to system restrictions, download preconfigured install. Highly-portable configured emacs though prefer modern emacs install and configuration---install both, highly-portable install as a second option if unforseen errors or compatability issues were not caught during install and configure process. Look at other minimal highly-portable editors similar to nano. Configure vim and nano. Consider writing my own terminal-based editor with extensability via shell scripts, though focus on editor-explorer-terminal fusion specified in my programming ideas document.
- Todo list output, reordering, and adding script. Consider emacs special mode integarted with an online todo list service.
- Calendar script with automatically output reminders when a given env var is set so that a perticular terminal can be prefurred.
    - Prompt integration?
- Custom dir and file information displayed with prompt and `l` script. Could affect styling with the `l` script. Could be stored in a specific location. Information could be displayed for files and dirs matching a glob or regex pattern.
- Scripts that interface with common webservices and websites I use.
- Script that searches file names, dir names, and file contents for given sets of regex patterns for a provided set dir-file globs. Use cases: find sensitive data including secrets and tokens, find blacklisted words and phrases. Provide follow up actions, like removing the text from the file, shredding or deleting the files, moving or quarantining the files, storing or printing a list of the files and their respective line and character numbers, or do nothing.
- Auto encrypt dir or auto shred dir for use with GUI file explorers, as a CLI command is preferable on the commandline, though consider measure to prevent accidental shredding.
- Robust and safe panic shred script with multiple options.
- Windows VM, VFIO, Looking glass, management script. Could be combined with testing VM management script.
    - Switch GPU between linux and windows vm.
    - Run a windows program.
    - Benchmark.
    - Test functionality.
    - Consider the possibility of running all or part of the dual boot windows install as the VM.
    - Snapshot management.
    - Attmept running with compatability layers such as WINE or Proton, else install native windows version in the VM.
- Dieting and excersise script.
- Break remoinder prompt.
- Private potentially encrypted `notes` repo counterpart, including read everyday mindset information.
- Script to upload or download files too or from main home mechine, and any other mechine unix-home-dir is installed on, as well as other systems that do not have `unix-home-dir`.
- Consider `ssh`, `ftp`, etc. wrapper script. Look at any previous attempt at this, either in my dual boot install, `unsorted` repository, Google Drive, or elsewhere.
- API post, get, etc. wrapper lib script.
- Firewall and antivirus wrapper script.
- Malicious activity monitoring script with various verbosity modes, and potential interactivity. With configurable conditional logging.
- Script to send and retrieve files to and from android. Preferably instead have a directory that is synced with the internal and external storage of the android device over the internet, or at least, over the local network, with blacklist/whitelist functionality so system and unimportant files can be blacklisted. Ideally sync the device to a bootable android VM. Have feedback when sync is progress or completed.
- Banking script. Script that interfaces with a finance application or Google sheet.

- 2024-04-03 (Todo copys with elabournation to be prioritised)
    - Write argument parsing and interactivity lib scripts; and, add functionality to the `home` script:
        - `gitm`.
        - User additions. Argument to Create user's own `unix-home-dir` at setup their install so that the user can push and pull from their own `unix-home-dir` remote, and in the pull case, the original `unix-home-dir` remote is pulled before the users remote.
        - Single script installation. Arguments to download only a given script and its depedencies, or a given script with sourced scripts inserted in place (see relevent todo). Consider first implementing seperating scripts into their own repositories either nessessariliy and automatically, or optionally and manually.
        - `unix-home-dir-dev`. Implement `unix-home-dir-dev` for development of `unix-home-dir` before public release. Allow the option of only the latest commit or pushing all new commits to the public repository. Consider facilitating this via the `home` script, githooks, or GitHub actions. GitHub actions could be used to automatically push commits from the `master` branch of `unix-home-dir-dev` to the `master` branch of `unix-home-dir`, where development is done on the `development` branch, or change-specific branches. Consider the implications of changing the local branch directly in the home directory---perhapse the `home` script should handle pushing changes so that the `master` branch of `unix-home-dir` is pushed to a change-specific or `development` branch of `unix-home-dir-dev` without changing the local branch and repository.
    - `l`.
    - `pkm`.
- TEMPLATE AUTOMATION. Automate setting config file values in new repos that are created from a template.
    - Look at `pggset` script, or whatever I named it, for ideas---the name is in the readme of the gpl template repository unless the script was renamed. The script could be in some commit on some branch of the `unix-home-dir`` repository, or in the `unsorted` repository.
    - TARGET PATTERN FILE. Maybe have a file in each template repository that specifies text to change, remove, or insert, with support for sed patterns and various parsers such as a portable way to use `jq` or alternative portable parsers.
    - AUTOMATION SCRIPT IDEAS:
        - A script could also be added to the repository that looks for `gitm` using `which`, checks that it contains the link to my GitHub profile or some other unique identifier, and executes it with arguments to perform the automation.
            - DRAWBACK. Though if the script name is changed from `gitm`, or I change my GitHub username, this functionality would break, though I could prevent that by automating commits across all template repos where I change the script or scripts.
        - Option 2: A script could be added to the repository that simply installs `gitm` using the prospective `home` single script install functionality, and runs it on the repository. Said functionality could first search for the existance of the same script on the users system, with identification logic as specified in option 1, and prompt the user whether they want to update it. Alternativly, fields could have a unique identifier prefix to indicate the following identifier is for use with the automation, and then the following identifier could have the same meaning across all template repositories, potentially removing or reducing the need for the pattern file: for example, `{{AUTOMATION_IDENTIFIER_HERE repository-name}}`, `{{AUTOMATION_IDENTIFIER_HERE author-name}}`, etc. Handle potential false positives.
        - Consider haveing any general automation scripts in a git submodule that always pulls the latest commit, or some submodule alternative. This would allow the prevention of breaking changes. Project specific scripts would not be in this submodule. The automation execution script would be in the submodule, and it should download and execute a script from `unix-home-dir` that contains the complex automation logic, likely the `gitm` script, but perhapse have a symlink or wrapper script that in turn downloads and executes the `gitm` script. This way, `gitm` can be renamed without needing to change the script in the submodule or template repo.
- Read `webi` scripts for ideas.
- Remove as much hardcoding of filenames and directories as possible. Scripts should not be assumed to be in `~/bin`. Either: hardcode a single folder with symlinks or config file, the config could be part of `~/home`; use a conventional already existing file or dir for this purpose; store the locations in `~/.profile`, though consider other users; or devise a differnt novel method. Maybe store values in `~/home` script, and have args for the script to self-edit. Ideally all `unix-home-dir` related files should be able to be renamed and moved without breaking functionality, this may require symlinks or some unique metadata (inodes?), where script reference the untouched symlink dir, maybe cloning repo to a dir then inserting symlinks to the repo dir is ideal, then the home script could add files via glob by either moving them to the repo dir and replacing them with a symlink, or, ideally, creating the symlink in the repo dir if that will work with git. Give the user maximum flexability, freedom, and extensability.

```sh
wget https://raw.githubusercontent.com/rzjnzk/unix-home-dir/master/home -O ~/home && sh ~/home install

# ... change to ...

curl -sS https://raw.githubusercontent.com/rzjnzk/unix-home-dir/master/home | sh -s -- i
wget -qO- https://raw.githubusercontent.com/rzjnzk/unix-home-dir/master/home | sh -s -- i

# ... or have the default behaviour be full repo installation ...

wget -qO- https://raw.githubusercontent.com/rzjnzk/unix-home-dir/master/home | sh

# Consider ...


```

- Remove all logic that can be abstracted from ~/home to other scripts and use the dynamic search else download logic

- Possible `~/home` args:
    - home s|script script-name-here arg1 arg2 (execute a script, check if `script-name-here`` is in the path or in the script dir, otherwise download it from the repo and pipe it to sh) (this would allow on the fly temporary usage of scripts and also a script wrapper for scripts that conflict with other script in the path. scripts that conflict with executables in the path, whether before or after, should be printed by the `~/.profile` script to stderr because profile stdout to file functionality is to be added. there should be a notice of how to correct the path or how to access the script via home script. any scripts that use other scripts should uses realtive or absolute paths to prevent conflicts from breaking the scripts) (i could do it the other way, and if there is a conflict in the path, the thirdparty executable is accessed by a wrapper script, since the path exported from bashrc, and maybe profile, is only for the users interactive terminal, so it wouldnt break functionality)
    - home i|install -s|--standalone script-name-1-here script-name-2-here (standalone: combine script and all its dependancy scripts) (no standalone flag: download script and all its dependancy scripts to the script dir)

## Rough notes

focus on stuff that gives me immediate benefit, example: imageine actually using gitm, what do i want it to atleast do right now?

sh lib bundler
home run script no dl
unix-home-dir repo layered update/pull fork chain
divide .profile for maintainability and easy instruction to others on how to extend, seperation of concerns
gitm repo list is good enough rn after colorising local repo names
    move to repl with occasional interactive confirmations and logical next steps or interactive for ommited next args idea for ease of use. write down the commands that make sense
gitm repl/commandline args
gitm repo from template with frankenstein templating? {{gpas}} idea? file to define sets globs to not delete from a freshly pulled template when certain args are given? gitm arg 'barebones' 'electron' 'web' 'react-only'
pkm
arg parser / repl / interactive, repl over interactive?
build
lint
light editor? in posix c? emacs config?

arg-parser + repl + interactive combo lib/libs1
    if second args not provided in repl, go interactive

    ls, l, list <grep_pattern>

    OR

    ls, l, list [templates|t|all|a|nontemplate|nt|local|cloned|specific-owner]

    mv, m, rename <old_name> <new_name>
    rm, r, delete <name>
    login <username>
    logout
    edit, e, open, o <name> (use EDITOR env var)

prompt switcher, use last selected when reopening is save arg passed

## Potential file structure

~
    (Public mostly, nessessary for functionality)
    .gitignore
        (specify included files via unignore after a global ignore)
    .gitattributes
        (specify unix line endings for the repo)
    .gitmodules
        (not currently used)
    README.md
        (repo description, usage, and installation instructions)
    .profile.d/
        README.md
        .config/
            scripts/
                host-profiles/
                    (contents private, empty dir cant be commited, but doesnt matter since its created by `.profile.d/bin/index`)
                prompts/
                    debian
                    min
                    verb
                welcome-messages/
                    (none added so far)
        assets/
            templates/
                host-profile
        bin/
            index
        state/
            ()
            selected-prompt
            selected-welcome-message
    .bashrc
        (mostly default i think with some auto appended lines from various thirdpart installations, likely currently non essential)
    .bash_profile

    .bash_logout
    .hushlogin
    .vimrc
    Unexclude when token encryption is handled.
    !/.gitconfig
    gitconfig
    .gitconfig.user.d/
    bin/
    !/.subversion/
    # Dir containing plaintext password store.
    /.subversion/auth/svn.simple/
    !/.emacs.d/init.el
    !/.emacs.d/README.md
    !/.emacs.d/snippets/
    !/.emacs.d/elisp/
    !/.emacs.d/
    /.emacs.d/auto-save-list/
    /.emacs.d/backups/
    /.emacs.d/var/
    /.emacs.d/transient/
    /.emacs.d/network-security.data
    # Temporary.
    /.emacs.d/git/
    data/

    (Public or personal undecided)
    .profile (Note `.profile.d` in the public section) (Installation could or maybe should simply append sourcing `.profile.d/bin/index` if not already present.)

    (Personal)

    notes/
    include/


One example of possible usage, as described in the help message that can be printed with either of the above commands: execute a given script with the provided arguments.

This is done by downloading the selected script from the repositories `/bin/` dir and piping it to `sh` with the provided arguments:

Neither `u` or the selected script are downloaded to the local filesystem, and the system is not modified any way unless intended by the selected script usage.

## Directory Structure (removed from READMD.md, here to show how to currectly fo file links)

TODO: Update or remove this list in favor of the `.gitignore` file, or add automatic generation based on the `.gitignore` file.

- [.bash_logout/](.bash_logout/)
- [.bash_profile/](.bash_profile/)
- [.bashrc/](.bashrc/)
- [.cache/](.cache/)
- [.clang-format/](.clang-format/)
- [.config/](.config/)
- [.emacs.d/](.emacs.d/)
- [.env/](.env/)
- [.git/](.git/)
- [.gitattributes/](.gitattributes/)
- [.gitconfig/](.gitconfig/)
- [.gitconfig.user.d/](.gitconfig.user.d/)
- [.githooks/](.githooks/)
- [.gitignore/](.gitignore/)
- [.gitmodules/](.gitmodules/)
- [.gnupg/](.gnupg/)
- [.java/](.java/)
- [.lesshst/](.lesshst/)
- [.local/](.local/)
- [.netrc/](.netrc/)
- [.npm/](.npm/)
- [.pki/](.pki/)
- [.profile/](.profile/)
- [.profile.hosts.d/](.profile.hosts.d/)
- [.profile.old/](.profile.old/)
- [.ssh/](.ssh/)
- [.subversion/](.subversion/)
- [.sudo_as_admin_successful/](.sudo_as_admin_successful/)
- [.vim/](.vim/)
- [.viminfo/](.viminfo/)
- [.vimrc/](.vimrc/)
- [README.md/](README.md/)
- [bin/](bin/)
- [check.raw.txt/](check.raw.txt/)
- [cmd/](cmd/)
- [home/](home/)
- [lib/](lib/)
- [libs-bin/](libs-bin/)
- [libs-src/](libs-src/)
- [reference/](reference/)
- [tmp/](tmp/)

---

GitHub Copilot: 1. The `.bashrc` and `.zshrc` files are typically executed for interactive, non-login shells. When you open a new terminal window in a graphical environment, this usually starts an interactive, non-login shell, which sources `.bashrc` or `.zshrc`. However, some systems are configured to also source `.bashrc` from `.bash_profile` or `.profile`, which would cause `.bashrc` to be executed for login shells as well. This behavior can vary between systems.

2. If you override common Unix commands in `.profile`, it will affect all login shells, both interactive and non-interactive. This could potentially cause problems for scripts or programs that are run in a login shell and expect the original behavior of the overridden commands. If you want to override commands only for interactive shells used directly by the user, it would be safer to do it in `.bashrc` or `.zshrc`.

3. A login shell is the first shell that is started when you log into a system. This can happen in several ways:

   - Logging in at the console in text mode.
   - Logging in through SSH.
   - Opening a terminal session that is configured to start a login shell (some terminal emulators have this option).

   When a login shell starts, it reads configuration from certain files, such as `.profile` or `.bash_profile`. This is independent of whether the shell is interactive or not.

    In contrast, when you open a new terminal window in a graphical environment, this usually starts an interactive, non-login shell. This shell reads configuration from other files, such as `.bashrc` or `.zshrc`.

    Some systems are configured to start a login shell when you log into the graphical environment. In this case, `.profile` would be sourced when you log in, and `.bashrc` would be sourced when you open a new terminal window.

---

1
2
3
4
5
6
7
8

bins
gitl
diffp
do-full-benchmark
jpgtopng

test-arg-parser
test-colors

## SIMPLE WEB INFO
news
weather
define
getip

## ALIASES-LIKE AND SIMPLE COMBINATION SCRIPTS
touchbin
touche
mkdircd
cl -> clr
clr
nr
l
h
e
sudou

## CONVENIENCE COMBINING WRAPPERS
lint
build

## MANAGEMENT SOLUTIONS
pkm
mountm

## LAZY
install-ranger





## SENSITIVE PATHS
"${HOME}/.config/gh/hosts.yml"
"${HOME}/.npmrc"
"${HOME}/.netrc/"
"${HOME}/.git-credentials"









# Unexclude when token encryption is handled.
# !/.gitconfig
/.gitconfig
!/.gitconfig.user.d/

## Currently in gitignore but shouldnt be part of the base repo
.vimrc
bin/
data/
notes/
include/

## Should already be on the system, should not add to the base repo
.profile
.bashrc
.bash_profile
.hushlogin
.bash_logout

## Should already be on the system, might add to the base repo


# Should possibly be part of the base repo
.gitignore
.gitattributes
README.md
.profile.d/








.gitignore
.gitattributes
README.md
README.template.md

.u
    .config
        bashrc.d
            bashrc
        profile.d
            hosts
                DESKTOP-DCHFQSJ
                uss.cs.adelaide.edu.au
            profile
            prompts
                debian
                min
                system-default
                verb
            welcome-messages
        u
            remotes
                home
                home.file-map
    .gitignore
    .local
        bin
        state
    CHANGELOG.md
    README.md
    README.notes.md
    assets
        messages
            notify
            onboarding
    bin
        u -> ../libexec/u
    etc
        bashrc
        profile
    lib
    libexec
        bin
        u
    opt
        github.com
            rzjnzk
                aliases
                    bin
                user-scripts
                    bin
    share
        bash-completion
            completions
                u
        doc
        man
    state
        profile.d
            selected-prompt
            selected-welcome-message
    tmp








/usr/local/share
    ca-certificates/
    emacs/
    fonts/
    man/
    sgml/
    xml/

/usr/libexec/
    at-spi-bus-launcher*
    at-spi2-registryd*
    coreutils/
    dconf-service*
    dpkg/
    glib-pacrunner*
    installed-tests/
    man-db/
    packagekit-direct*
    packagekitd*
    pk-debconf-helper*
    pk-offline-update*
    plymouth/
    polkit-agent-helper-1*
    polkitd*
    rtkit-daemon*
    sudo/
    xdg-desktop-portal*
    xdg-desktop-portal-gtk*
    xdg-desktop-portal-rewrite-launchers*
    xdg-desktop-portal-validate-icon*
    xdg-document-portal*
    xdg-permission-store*





## root-dir "${HOME}"
## pull master:master http://github.com/rzjnzk/u-home-dir
## push master:master http://github.com/rzjnzk/u-home-dir

/*
!/.netrc




## root-dir "${HOME}"
## pull master:master http://github.com/rzjnzk/u-home-dir-encrypted
## push master:master http://github.com/rzjnzk/u-home-dir-encrypted
## encrypt true


## root-dir ${U_DIR}/opt/aliases
## pull master:master http://github.com/rzjnzk/aliases 3777c50db1b6a0ab367b32b502d4c084bafc9a34
## push master:development http://github.com/rzjnzk/aliases











---

remotes
    aliases.pull.gitignore
    aliases.push.gitignore
    all.group
    credentials.pull.gitignore
    credentials.push.gitignore
    default.group
    gitm.pull.gitignore
    gitm.push.gitignore
    u-home-dir-encrypted.pull.gitignore
    u-home-dir-encrypted.push.gitignore
    u-home-dir.pull.gitignore
    u-home-dir.push.gitignore

git.groups
    all.ini
    default.ini
git.remotes
    aliases
        config.ini
        pull.gitignore
        push.gitignore
    credentials
        config.ini
        pull.gitignore
        push.gitignore
    gitm
        config.ini
        pull.gitignore
        push.gitignore
    u-home-dir-encrypted
        config.ini
        pull.gitignore
        push.gitignore
    u-home-dir
        config.ini
        pull.gitignore
        push.gitignore

---

Yes, you are correct:

- In `git push origin local:remote` (or with full refs: `git push origin refs/heads/local-branch:refs/heads/remote-branch`),
  - **Left side (before colon):** local branch or ref
  - **Right side (after colon):** remote branch or ref

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

---

SUPPORT FILE REMAP FREEDOM, MAYBE IN COMMENTS IN GITIGNORE ON THE END OF EACH LINE OR ABOVE

.gitignore
.gitattributes
README.md
README.template.md

.u/
    .config/
        bashrc.d/
            bashrc
        profile.d/
            hosts/
                DESKTOP-DCHFQSJ
                uss.cs.adelaide.edu.au
            profile
            prompts/
                debian
                min
                system-default
                verb
            welcome-messages/
        u/
            git.groups/
                all.ini
                    ```
                    ```
                default.ini
                    ```
                    ```
            git.remotes/
                aliases/
                    config.ini
                        ```
                            # NOTE: pull and push mimic git command order: `git push --verbose origin refs/heads/your-branch-name:refs/heads/your-branch-name`.
                            cd "${U_DIR}/opt/aliases"
                            pull http://github.com/rzjnzk/aliases master:master
                            push http://github.com/rzjnzk/aliases master:development

                        ```
                    pull.gitignore
                        ```
                        ```
                    push.gitignore
                        ```
                            # NOTE: If this file doesn't exist, use the .gitignore in the repo if it exists.
                        ```
    .gitignore
    .local/
        bin/
        state/
    CHANGELOG.md
    README.md
    README.notes.md
    assets/
        messages/
            notify
            onboarding
    bin/
        u -> ../libexec/u
    etc/
        bashrc
        profile
    lib/
    libexec/
        bin/
        u
    opt/
        aliases/
            bin/
                cl -> ./clr
                clr
                e
                h
                l
                mkdircd
                nr
                sudou
                touche
                touchbin
    share
        bash-completion
            completions
                u
        doc
        man
    state
        profile.d
            selected-prompt
            selected-welcome-message
    tmp

---



aliases.pull.gitignore

## root-dir ${U_DIR}/opt/aliases
## pull master:master http://github.com/rzjnzk/aliases 3777c50db1b6a0ab367b32b502d4c084bafc9a34
## push master:development http://github.com/rzjnzk/aliases

aliases.push.gitignore

## root-dir ${U_DIR}/opt/aliases
## pull master:master http://github.com/rzjnzk/aliases 3777c50db1b6a0ab367b32b502d4c084bafc9a34
## push master:development http://github.com/rzjnzk/aliases








ROOT="${HOME}"
PULL_REMOTE_URL="https://github.com/rzjnzk/unix-home-dir"
PULL_REMOTE="origin"
PULL_REMOTE_BRANCH="master"
PUSH_REMOTE_URL="https://github.com/rzjnzk/unix-home-dir"
PUSH_REMOTE="origin"
PUSH_REMOTE_BRANCH="master"

---

## TODO

- push logic
- pull logic
- consider separating `u` logic into other `libexec/bin/` files or `lib/` files
    - consider how to handle this when `u` is executed by download to pipe, and ideally make it so `u` can execute any arbitrary `opt/` script
- lib/escape-var-sed.sh
- lib/arg-parser.sh
- lib/arg-prompt.sh (maybe call arg-interactive.sh)
- pkm (and maybe use for `_ensure_git()` in `libexec/bin/u`)
- share/man, share/doc, or lib/print-leading-comments.sh? (it would be nice to use standard man page files and get help working with man, but calculated help information would also be nice)
- `share/bash-completion/completions/u` and any other files? (would be nive to get completion working when writing shell scripts, not just in the terminal, especially when using `lib/` files)
- lib/log.sh?
- lib/print-err.sh?
- lib/colors.sh?

---

History files (ask AI if its safe to delete all these manually, or whether they should be cleared using a specific command):

- ~/.bash_history
- ~/.python_history
- ~/.lesshst
- ~/.zsh_history?
- ~/.local/share/fish/fish_history?
- ~/.config/fish/fish_history?
- ~/.config/nnn/.history
- ~/.local/share/ranger/history

---

Log files (ask AI if its safe to delete all these manually, or whether they should be cleared using a specific command):

- ~/.npm/_logs/*

---

Caches (ask AI if its safe to delete all these manually, or whether they should be cleared using a specific command):

- ~/.cache/
- ~/.nvm/.cache/bin/*
- ~/.npm/_cacache/
    - (contains dirs `content-v2/sha512/*`, `index-v5/*`, and `tmp/*` maybe I would have to delete the contents of these dirs rather than the whole `_cacache` dir?)

---

## Finding collaborators

    - Find someone, perhaps on The Programming Hub discord, who is interested in working on `u` with me. Ideally someone with talent that I could possibly recruit for my startup in the future. Note that I likely cannot mention that I might be interested in hiring them in the future on The Programming Hub.
        - Option 1: Post an ad explaining the project without giving away future or un-pushed ideas, noting that it is unpaid and open-source work and is work at your own pace with no time demands, asking for people who are capable POSIX shell script programmers or who are fast learners who are willing to let me teach them POSIX shell scripting as we progress. Note that I would also be okay with anyone that would simply be okay with discussing ideas with me. Note that voice chat is preferred. Note that I am also looking for people willing to test or use the system when it is functional, especially those that could spread the word to help facilitate adoption and new collaborators.
        - Option 2: Read the message history, looking for possible candidates.
    - Look at places other than Discord to post ads, or read ads by people looking for open-source POSIX shell script projects to work on.
    - IMPORTANT/VITAL: Protecting my work.
        - Consider licensing and copyright.
            - Research how to have the LICENSE apply to the whole repository, except for code that is not my own, or too generic to license.
            - Verify whether its true that all the original code in the repository is automatically copyrighted to me if no license file exists.
            - Consider whether I want to disallow derivative works, or whether I want derivative works to be allowed, and if so, whether I want to allow them to be commercial or require that they be open-sourced. If I want to allow derivative works, I definitely want there to be a link back to my original work, and I want to be credited as the original author.
        - Commit my progress first so that if anything is stolen there is a record that I was the original author.
        - Screenshot any ads or correspondence.
        - If an ad is made on Discord:
            - 1. Record the UTC date and time based on the timestamp of the message.
            - 2. Screenshot the Discord window with the ad in view.
            - 3. Record the Discord server name, link, and ID.
            - 4. Record the channel name, link, and ID.
            - 5. Record the message ID.
        - If an ad is made on a different platform:
            - 1. Record the UTC date and time based on the timestamp of the post.
            - 2. Screenshot the full site with the ad in view.
            - 3. Record the platform name, the link to the ad, and any ID's.

## Spreading the word to facilitate adoption and new collaborators

    - Before spreading the word, make sure my personal socials cannot be deduced from my GitHub profile, repositories, or any social media accounts I may post about it on. Ensure I have not posed about it in the past on socials that are linked to me, such as twitter, programming discord's, reddit, StackOverflow and related sites, Facebook, etc.
    - Post on The Programming Hub discord.
    - Post on Reddit in relevant subreddits.
    - See if Martin, Chef, Navid, Tash, Daniel, Tpc guy, Lithuanian guy, would use it, or if they have friends or friends of friends that would use it, or if they are willing to post about it on their social media or in otherwise spread the word in their network and programming circles.
    - AI suggestions:
        - Post on Hacker News.
        - Post on Indie Hackers.
        - Post on Twitter.
        - Post on Mastodon.
        - Post on LinkedIn.
        - Post on Facebook groups.
---

## `wget` and `curl` `u` script ideas
```sh
wget -O- https://raw.githubusercontent.com/rzjnzk/u/master/libexec/bin/u | sh -s -- init

curl -L https://raw.githubusercontent.com/rzjnzk/u/master/libexec/bin/u | sh -s -- init

curl -L https://raw.githubusercontent.com/rzjnzk/u/master/init.sh | sh

curl -L https://raw.githubusercontent.com/rzjnzk/u/master/install.sh | sh

curl -L https://raw.githubusercontent.com/rzjnzk/u/master/install.sh | sh -s -- aliases encrypted
```

Perhapse have a script at `https://raw.githubusercontent.com/rzjnzk/u/master/u`, that is also present in user forks, with the code:

```sh
#!/bin/sh

set -e

if
    command -v curl >/dev/null 2>&1
then
    curl -sS https://raw.githubusercontent.com/rzjnzk/u/master/libexec/bin/u | sh -s -- "${@}"
elif
    command -v wget >/dev/null 2>&1
then
    wget -qO- https://raw.githubusercontent.com/rzjnzk/u/master/libexec/bin/u | sh -s -- "${@}"
else
    printf "%s" "Error: Neither \`wget\` nor \`curl\` is installed." >&2

    exit 1
fi
```

---

## Nameing Ideas

I have settled on the name `u` for the script, the name of the base repo is yet to be decided.

Base repo name ideas:

- u
- dot-u
- u-tool
- u-system
- u-dotfiles (it's probably better to use this name for the opt repo that versions the user dotfiles, if used at all)
- ugit
- u-git
- git-u

User fork repo name ideas:

- (same as base repo name)

Old base repo name ideas:

- unix-unification-*
- unified-*
- unification-*
- unify-*\

`${U_DIR}/opt` repo loose naming convention:

- u-*
- dot-u-*
- u-opt-*
- dot-u-opt-*

Non-opt overlay files repo naming convention:

- u-overlay-*
- dot-u-overlay-*

TODO: Consider alternative names: `h` (1 gh repo uses this https://github.com/hypothesis/h), base, layor, stacked, stack, modular, manager, managed, sync, setup, config, auto, extensible, kit, stack, builder, tool, util, homedown, cfg.

BEST SINGLE LETTER OPTIONS

j - jump
   (BEST ergonomically, and name-collision avoidance.)
   (since the core concept is 'jumping' between unix systems, or reinstallations, etc.)
h - help / home / hub
    (BEST for beginners.)
    (DECENT for neumonic association, and ergonomically.)
    (Since the toolset makes things more simple and automated this toolset appeals to beginners, and as such: `h` for home, hub, or especially help, is an easy to remember name and can be stumbled upon by accident if forgotten. Though this point is made atleast partly redundant if we make the existing `help` command output its usual output followed by this scripts help output with clear titles for each)
u - unix / user / unified / utils / micro
    (BEST for neumonic association, name-collision avoidance.)
    (DECENT ergonomically.)
    (`u` is the single letter that is likely the most neumonically associable of the acceptable single letters)

---

## Comments from the top of the `u` script.

TODO: Consider outsourcing logic to `~/bin` and `~/bin/lib.d` scripts. Attempt to find the relevent scripts in their expected install locations, and if they are not found, then download them from the main repository. Support usage of this script by piping the downloaded file to `sh` for users that dont want to install the full `unix-home-dir`, in which case, dependancy scripts should be used without saving to disk, or by saving to a conventional temp dir with full conflict prevention. This could also be the default behaviour for regular installation, though it would could network usage, though perhapse negligably, making script usage less confusing. Support temporary usage of any `~/bin` script thought an argument of this script: download and pipe this script to `sh`, then do the same inside this script.

TODO: Refactor for maximum backwards compatibility. The user should be able to use this script from their outdated install or by downloading and executing it from the main repository.


---

## Notes (2025-07-01)

- `u` install, pull, push, remove, in that order
    - gpg encryption for sensitive files
- `u` file division between forks and master, as well as update notifications
- `u` onboarding after init, interactivly prompt for reccomended opts, displaying the one-line decriptions of each script in each opt
- man page for `u`, `u` commands, and other scripts, ideally with dynamically generated information, as self-documenting as possible
0 bash_completion, and any other completion, especially for `u` commands
- shdocs for libs
- `u` repo name ideas (see above)
- implement libs: arg-parser, arg-prompt, escape-var-sed

---

Collecting workspace informationThank you for clarifying! Here are direct answers to your questions:

---

### 1. Handling Upgrades for `~/.u/config`

- **Goal:**
  - Do **not** overwrite existing files in `~/.u/config` during upgrade.
  - **Add** any new files from the base repo’s config that do not exist in the user’s `~/.u/config`.

- **How to do it:**
  Use `rsync` with the `--ignore-existing` flag to copy only new files:

  ```sh
  rsync -av --ignore-existing "${U_DIR}_base/config/" "${U_DIR}/config/"
  ```

  - This will copy new files and directories from the base repo’s config into the user’s config without overwriting anything already present.

---

## Potentially usefult sh scripting notes from grok

Bash IDE    mads-hartmann.bash-ide-vscode



aaron-bond.shell-script-command-completion

foxundermoon.shell-format
rogalmic.bash-debug
dominic-valerio.bash-runner


  Adopt defensive coding practices, e.g.:sh

: "${var:=default}"  # Set default if unset

Avoid command substitutions in loops; use while loops with read for file processing.

{
  "files.associations": {
    "*": "shellscript"  # Treat extensionless files as shell scripts
  }
}

Workflow RecommendationsInstall Core Extensions:ShellCheck, shell-format, Bash IDE, Shellman, and Shell Script Command Completion.

Configure ShellCheck for POSIX:Use --shell=sh and enable quick fixes.

Standardize Comments:Use shdoc-style comments for documentation and rely on Bash IDE for hover info.

Automate Formatting:Enable shell-format on save for consistent code.

Test Regularly:Run scripts in dash or sh to verify POSIX compliance.
Use Bash Debug for complex scripts, but validate POSIX behavior.

Generate Documentation:Use shdoc or similar tools to create external documentation for complex projects.

strace: Traces system calls and signals made by a program, showing interactions with the OS (e.g., file operations, process creation). Useful for debugging and performance analysis, like identifying forks. Example: strace -c sh script.sh summarizes calls.
ps: Lists running processes with details (e.g., PID, CPU usage, command). Helps monitor subprocesses (forks) created by scripts. Example: ps aux | grep script.sh shows script-related processes.

strace: No, it runs the program and traces system calls/signals during execution. It doesn’t just read the file. Example: strace sh script.sh monitors live system calls.
ps: No, it doesn’t read the file; it lists currently running processes and their details (e.g., PID, CPU). Example: ps aux shows all processes, not script content.
time: No, it runs the program and measures execution time (real, user, system). It doesn’t read the file without running it. Example: time sh script.sh reports timing stats.


---

## Commented out files and dirs could stay in base repo, not the users


/home/user/.u
├── .github
<!-- │   ├── FUNDING.yml
│   ├── ISSUE_TEMPLATE
│   │   └── name-conflict
│   │       └── environment-variable
│   │           └── U_DIR.md
│   ├── PULL_REQUEST_TEMPLATE.md -->
│   └── workflows
│       └── main.yaml (maybe, is there is a use for the user, otherwise they could add it themselves)
├── .gitignore
├── .vscode
│   └── settings.json (maybe, if files.associations is set for syntax highlighting of config)
<!-- ├── CHANGELOG.md -->
<!-- ├── README.md -->
<!-- ├── README.notes.md -->
├── README.template.md (USE-TO-GEN README.md)
├── bin
│   └── u -> ../libexec/bin/u
├── config
│   ├── bashrc
│   │   └── bashrc
│   ├── profile
│   │   ├── .conf
│   │   ├── profile
│   │   ├── prompts
│   │   │   ├── debian
│   │   │   ├── min
│   │   │   ├── system-default
│   │   │   └── verb
│   │   ├── scripts
│   │   │   ├── DESKTOP-DCHFQSJ
│   │   │   └── uss.cs.adelaide.edu.au
│   │   └── welcome-messages
│   │       └── .gitkeep
│   └── u
│       └── remotes
│           ├── aliases
│           │   └── .gitkeep
│           ├── all.conf
│           ├── default.conf
│           ├── diagnostics
│           ├── encrypted
│           │   └── .gitkeep
│           ├── example
│           │   ├── .conf
│           │   ├── pull.gitignore
│           │   └── push.gitignore
│           ├── groups
│           │   └── .gitkeep
│           └── home
│               └── .gitkeep
<!-- ├── etc
│   ├── bashrc
│   └── profile
├── lib
│   ├── arg-parser.sh
│   ├── arg-prompt.sh
│   ├── escape-var-sed.sh
│   ├── get-netrc-credentials.sh
│   ├── log.sh
│   ├── print-err.sh
│   ├── print-leading-comments.sh
│   ├── set-ifs.sh
│   ├── supports-function-args.sh
│   └── terminal-text-attributes.sh -->
├── libexec
│   └── bin
│       └── u (or wrapper script in root)
<!-- ├── local
│   ├── .config
│   └── bin -->
<!-- ├── opt
│   ├── example
│   │   ├── bin
│   │   │   └── .gitkeep
│   │   ├── lib
│   │   │   └── .gitkeep
│   │   └── share
│   │       ├── bash-completion
│   │       │   └── completions
│   │       │       └── executable-name
│   │       │           └── .gitkeep
│   │       └── man
│   │           └── man1
│   │               └── some-name.1
│   └── libshcommon
│       └── lib
├── share
│   ├── bash-completion
│   │   └── completions
│   │       └── u
│   ├── doc
│   └── man
│       └── man1 -->

---

Found configured `github.com` credentials.

Select credential source:

1. rzjnzk (git credential fill)
2. rzjnzk (~/.netrc)
3. rzjnzk (~/.config/gh/hosts.yml)
4. test1 (~/.config/gh/hosts.yml)
5. test2 (~/.config/gh/hosts.yml)



Found configured `github.com` credentials.

Select credential source:

1. rzjnzk (git credential fill).
2. rzjnzk (~/.netrc).
3. rzjnzk (~/.config/gh/hosts.yml).
4. test1 (~/.config/gh/hosts.yml).
5. test2 (~/.config/gh/hosts.yml).



Found configured `github.com` credentials.

Select credential source:

1. rzjnzk (source: `git credential fill`).
2. rzjnzk (source: `~/.netrc`).
3. rzjnzk (source: `~/.config/gh/hosts.yml`).
4. test1 (source: `~/.config/gh/hosts.yml`).
5. test2 (source: `~/.config/gh/hosts.yml`).



Found configured `github.com` credentials.

Select credential source:

1. rzjnzk (source: git credential fill).
2. rzjnzk (source: ~/.netrc).
3. rzjnzk (source: ~/.config/gh/hosts.yml).
4. test1 (source: ~/.config/gh/hosts.yml).
5. test2 (source: ~/.config/gh/hosts.yml).



Found configured `github.com` credentials.

Select credential source:

1. rzjnzk.
- Source: `git credential fill`.
2. rzjnzk.
- Source: `~/.netrc`.
3. rzjnzk.
- Source: `~/.config/gh/hosts.yml`.
4. test1.
- Source: `~/.config/gh/hosts.yml`.
5. test2.
- Source: `~/.config/gh/hosts.yml`.



Found configured `github.com` credentials.

Select credential source:

1. rzjnzk.
    - Source: `git credential fill`.
2. rzjnzk.
    - Source: `~/.netrc`.
3. rzjnzk.
    - Source: `~/.config/gh/hosts.yml`.
4. test1.
    - Source: `~/.config/gh/hosts.yml`.
5. test2.
    - Source: `~/.config/gh/hosts.yml`.



Found configured `github.com` credentials.

Select credential source:

1. rzjnzk.
    - Source: `git credential fill`.

2. rzjnzk.
    - Source: `~/.netrc`.

3. rzjnzk.
    - Source: `~/.config/gh/hosts.yml`.

4. test1.
    - Source: `~/.config/gh/hosts.yml`.

5. test2.
    - Source: `~/.config/gh/hosts.yml`.

---

```sh
#/bin/sh

set -e

_repl_prompt_text=""
_repl__stage="SELECT_BINS"

while
    :
do
    if
        test "${_repl__stage}" = "SELECT_BINS"
    then

    then

    elif
        test "${_repl__stage}" = "RESOLVE_CONFLICTS"
    then

    fi

    printf "%s" "${_repl_prompt_text}> "

    read -r _user_input

    printf "\n"

done
```

```sh
# print all package list files with installed packages marked, and maybe listed together in a final section

# maybe just list installed packages and with what package manager, then a list of package files woth a hint to select via a second sub comand to l

pkm l/ls/l


# could have index selection to install index space seperated list of packages

pkm s/search package_names


pkm r package_names
pkm r -g dev


# update the package list. can be disabled with a command that edits a config file

# display a list with each available package manager, and which packages for each are can be installed with that package manager, with comprehensive selection prompt to insyall each package with desired manager

pkm i package_names


# install packages and append to specified groups)

pkm i -s dev webdev main -p docker npm nvm git
pkm i docker npm nvm git -s dev webdev main


# install packages and groups

pkm i -g dev other-group -p steam
pkm i steam -g dev other-group

# install all groups

pkm i -a/--all


# maybe -d for dry run or some other name for regular i/r commands, maybe -n

pkm g a/r -g dev webdev main -p docker npm nvm git

# lists groups if no more agrs, else lists the contents of the subsequent group args)
pkm g l/ls/lists
```

package group files that can be use with i command after -g.

command for saving and removing from groups (group file created if not present, and deleted when last package removed from group. way to specify package manager for eack package, and fallbacks if any, or fallback to anything, or interactivly select package manager like when installing a package not a group of packages. way to set order of preference for package manager for fall back to any, maybe also other uses

---

dir = "${U_DIR}/opt/custom_name_here"
is_use_git = true
is_overlay_files = false
visibility = public
is_encrypted = false
commit_hash = a8f4e2c1d9b7e6f3c2a1b0d4e5f6a7b8c9d0e1f2
pull_url = http://github.com/USER_NAME_HERE/REPO_NAME_HERE
pull_branch_remote =
pull_branch_local =
push_url = http://github.com/USER_NAME_HERE/REPO_NAME_HERE
push_branch_remote =
push_branch_local =

---

remote = http://github.com/USER_NAME_HERE/REPO_NAME_HERE
branch_remote =
branch_local =

---
