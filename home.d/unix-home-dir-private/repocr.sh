#!/bin/sh

(

# trap '_error $LINENO' ERR

_error()
{
    # _last_exit_code="${?}"
    # printf -- "Error on line ${1}.\n"
    # printf -- "Reloading gpg client to remove caches passphrases.\n"
    # gpg-connect-agent reloadagent /bye
    # exit "${_last_exit_code}"
    tput setaf 1
    printf -- "ERROR: ${1}\n"
    tput sgr0
    exit 1
}

_read_secure()
{
    stty -echo
    read ${1}
    stty echo
}

_prepare()
{
    printf -- "Input passphrase: "
    _read_secure _passphrase

    # TODO: Check for exiting files in repo, and print out relevent info.
    printf -- "Verifying passphrase.\n"
    gpg \
        --passphrase="${_passphrase}" \
        -o /dev/null \
        -d rand
    printf -- "Correct passphrase.\n"

    # BEGIN Target node linking.
    # Soft link absolute paths in `target-nodes` file to temp dir.
    cd ..
    IFS="$(printf -- "\n\t")"
    for _node in \
        $(cat target-nodes)
    do
        # Handle comments.
        test -n "$(printf -- "${_node}" | sed -n "/^ *#/ p")" && continue
        for _node_absolute in \
            $(realpath $(eval "printf -- \"${_node}\""))
        do
            mkdir -pv "$(dirname "./lndir${_node_absolute}")"
            ln -sv "${_node_absolute}" "./lndir${_node_absolute}" || :
        done
    done
    unset IFS
    cd data
    # END Target node linking.
}

_encrypt_main()
{
    _prepare

    # Archive files linked to in temp dir [`h` option vital].
    # Encrypt.
    # Split archive to satisfy github filesize limit.
    # Resulting files are effectively `data.tar.gz.gpg` split.
    mkdir -pv x
    rm -frv x/*
    cd x
    tar chvzf - ../lndir |
        gpg \
            --s2k-mode 3 \
            --s2k-count 65011712 \
            --s2k-digest-algo SHA256 \
            --s2k-cipher-algo AES256 \
            --yes \
            --batch \
            --passphrase="${_passphrase}" \
            -o - \
            -c |
                split --verbose -b 100m -
    cd ..
    rm -frv lndir
}

_decrypt_main()
{
    _prepare
    cat x/x* |
        gpg --passphrase="${_passphrase}" -o - -d |
            tar xhvzf - -C lndir
    rm -frv lndir
}

_change_passphrase()
{
    printf -- "Input new passphrase: "
    _read_secure _passphrase_new
    printf -- "Input new passphrase again: "
    _read_secure _passphrase_new_confirmation
    test "${_passphrase_new}" = "${_passphrase_new_confirmation}" ||
        _error "ERROR: Passphrases do not match."
    test -n "${_passphrase_new}"

    if
        test -f rand
    then
        printf -- "Input current passphrase: "
        _read_secure _passphrase_current
        cd x
        cat ../x* |
            gpg --passphrase="${_passphrase_current}" -o - -d |
                gpg \
                    --s2k-mode 3 \
                    --s2k-count 65011712 \
                    --s2k-digest-algo SHA256 \
                    --s2k-cipher-algo AES256 \
                    --yes \
                    --batch \
                    --passphrase="${_passphrase_new}" \
                    -o - \
                    -c |
                        split --verbose -b 100m -
        cd ..
        cat rand |
            gpg --passphrase="${_passphrase_current}" -o - -d |
                gpg \
                    --s2k-mode 3 \
                    --s2k-count 65011712 \
                    --s2k-digest-algo SHA256 \
                    --s2k-cipher-algo AES256 \
                    --yes \
                    --batch \
                    --passphrase="${_passphrase_new}" \
                    -o rand.tmp \
                    -c
        shred -vzu rand
        mv -v rand.tmp rand
    elif
        test -f x*
    then
        _error "ERROR: No \`rand\` file but \`x*\` file or files."
    else
        dd if=/dev/urandom bs=1K count=1000 |
            gpg \
                --s2k-mode 3 \
                --s2k-count 65011712 \
                --s2k-digest-algo SHA256 \
                --s2k-cipher-algo AES256 \
                --yes \
                --batch \
                --passphrase="${_passphrase_new}" \
                -o rand \
                -c
    fi
}

_shred_target_nodes()
{

}

_main()
{
    mkdir -pv "${_script_path}/data/lndir"
    cd "${_script_path}/data"
    case \
        "${1}"
    in
        decrypt | d )
            _decrypt_main
            ;;
        encrypt | e )
            _encrypt_main
            ;;
        change-passphrase | chp )
            _change_passphrase
            ;;
        shred-target-nodes )
            _shred_target_nodes
            ;;
    esac
}

set -e
_script_name="$(basename -- "${0}")"
_script_path="$(dirname -- "${0}")"
_script_path="$(cd "${_script_path}" ; pwd)"
_script_args="$(printf -- "%s\n" "${@}")"
# mkdir -p -- "${_script_path}/${_script_name}-logs"
_main "${@}" # | tee -a -- "${_script_path}/${_script_name}-logs/$(date --utc +%Y-%m-%d_%H-%M-%S)_UTC.log"

)
