#!/usr/bin/env bash

function create_user_group.usage() {
    cat << EOF
NAME
    /scripts/sys/create_user_group.sh - create user in the Docker container

SYNTAX 
    /scripts/sys/create_user_group.sh user user_id group [password] 

ARGUMENTS
    user: user name (which cannot be an empty string)
    user_id: user ID (which cannot be an empty string)
    group: an existing group name
    password: Optional password (cannot be empty) of the user. 
        If not provided, then the user name is used as the password.

DESCRIPTION
    Create a new user with the given (existing) group name.

EOF
}

function create_user_group() {
    if [[ $1 == "-h" ]]; then
        create_user_group.usage
        return 0
    fi
    if [[ $# < 3 || $# > 4 ]]; then
        create_user_group.usage
        return 1
    fi
    local user=$1
    local user_id=$2
    local group=$3
    local group_id=$(getent group $group | cut -d: -f3)
    local password=${4:-$user}
    /scripts/sys/create_user.sh $user $user_id $password $group $group_id
}

if [[ "$0" == ${BASH_SOURCE[0]} ]]; then
    create_user_group $@
fi
