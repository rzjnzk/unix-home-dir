#!/bin/sh

# Author: Robert Zack Jaidyn Norris-Karr <http://github.com/rzjnzk>

_github_new_repo()
{
    # surpress output and show errors if they occur
    curl --silent --output /dev/null --show-error --fail \
        -u "${_param_github_user}" \
        https://api.github.com/user/repos \
        -d "{\"name\":\"${_param_new_github_repo_name}\"}" || return 1
}

_g_setup_github_repo()
{
    _github_new_repo "${_param_github_user}" "${_param_new_github_repo_name}" || return 1

    # TODO: clone specified template repo into, or clone the rename to, `./${_param_new_github_repo_name}`
    # TODO: consider dotfile for named specified template repos, editable via script command or manually. The user should be able to enter either the remote URL/SHH, or a configured URL value

    # TODO: Interpolate template strings.
}

_main()
{

}

_main "$@"