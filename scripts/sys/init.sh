#!/usr/bin/env bash

function scripts_etc.usage() {
    cat << EOF
NAME
    scripts_etc - configuration for init

SYNTAX 
    scripts_etc pre/post [upper_index]

ARGUMENT
    pre/post: Run scripts in /scripts/etc_pre or /scripts/etc_post respectively.
    upper_index: The maximum index of scripts to run.

DESCRIPTION
    Run scripts in /scripts/etc_pre or /scripts/etc_post 
    which are for automatic configurations in Docker container.

EOF
}

function scripts_etc() {
    if [ "$1" == "-h" ]; then
        scripts_etc.usage
        return 0
    fi
    local upper_index=9${2:-999}
    local script
    for script in $(ls /scripts/etc_$1/[0-9][0-9][0-9]-*.sh 2> /dev/null); do
        local index=$(basename $script)
        index=9${index:0:3}
        if [[ $index -le $upper_index ]]; then
            echo "Sourcing the script $script ..."
            source $script
        fi
    done
}

function init.usage(){
    cat << EOF
NAME
    /scripts/sys/init.sh - init (PID 0) process in the Docker container
    
SYNTAX 
    /scripts/sys/init.sh [-u/--switch-user] [-e/--execute] [/script/to/run.sh]

ARGUMENTS
    -u/--switch-user: Switch to the specified (and created) Docker user and EXECUTE the specified script.
    -e/--execute: Execute (instead of source in) the specified script.
    Positional Argument(s): Path (by default, /scripts/sys/launch.sh) to the script to execute or source in.

DESCRIPTION
    This is the init shell process inside the Docker container.
    The main purpose of this shell script is to create the specified Docker user
    and then source/execute the specified script.
    While this is the preferred way of starting other processes in the Docker container,
    it is perfectly OK not to use this script if you do not want to create a new user inside the Docker container 
    and just want to use root (might run into various permission issues) to run processes.

EOF
}

function init.create_user(){
    export DOCKER_USER="${DOCKER_USER:-dclong}"
    export DOCKER_USER_ID="${DOCKER_USER_ID:-9001}"
    export DOCKER_PASSWORD="${DOCKER_PASSWORD:-$DOCKER_USER}"
    export DOCKER_GROUP="${DOCKER_GROUP:-docker}"
    export DOCKER_GROUP_ID="${DOCKER_GROUP_ID:-9001}"
    /scripts/sys/create_user.sh "$DOCKER_USER" "$DOCKER_USER_ID" "$DOCKER_PASSWORD" "$DOCKER_GROUP" "$DOCKER_GROUP_ID"
    gpasswd -a "$DOCKER_USER" sudo
}

function init(){
    local positional=()
    while [[ $# -gt 0 ]]; do
        local key="$1"
        case $key in
            -h|--help)
                init.usage
                return 0
                ;;
            -u|--switch-user)
                local switch_user=YES
                shift
                ;;
            -e|--execute)
                local execute=YES
                shift
                ;;
            *)
                positional+=("$1")
                shift
                ;;
        esac
    done
    init.create_user
    export HOME=/home/$DOCKER_USER  # Do NOT remove!!
    scripts_etc pre
    local script=/scripts/sys/launch.sh
    if [[ ${#positional[@]} -gt 0 ]]; then
        script="${positional[@]}"
    fi
    if [[ "$switch_user" == YES ]]; then
        su "$DOCKER_USER" -c "$script"
    else
        if [[ "$execute" == YES ]]; then
            "$script"
        else
            source "$script"
        fi
    fi
    # /scripts/sys/etc.sh post
}

if [[ "$0" == ${BASH_SOURCE[0]} ]]; then
    init "$@"
fi
