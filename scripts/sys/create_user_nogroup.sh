#!/usr/bin/env bash

function create_user_nogroup.usage() {
    cat << EOF
NAME
    /scripts/sys/create_user_nogroup.sh - create user in the Docker container

SYNTAX 
    /scripts/sys/create_user_nogroup.sh user user_id [password] 

ARGUMENTS
    user: user name (which cannot be an empty string)
    user_id: user ID (which cannot be an empty string)
    password: Optional password (cannot be empty) of the user. 
        If not provided, then the user name is used as the password.

DESCRIPTION
    Create a new user with the group name "nogroup".

EOF
}

function create_user_nogroup() {
    if [[ "$1" == "-h" ]]; then
        create_user_nogroup.usage
        return 0
    fi
    if [[ $# < 2 || $# > 3 ]]; then
        echo "2 or 3 arguments are required while $# were provided!"
        return 1
    fi
    local user="$1"
    local user_id="$2"
    local group=nogroup
    local password="${3:-$user}"
    /scripts/sys/create_user_group.sh "$user" "$user_id" "$group" "$password"
}

if [[ "$0" == ${BASH_SOURCE[0]} ]]; then
    create_user_nogroup "$@"
fi
