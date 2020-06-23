#!/usr/bin/env bash

function create_user_docker.usage() {
    cat << EOF
NAME
    /scripts/sys/create_user_docker.sh - create user in the Docker container

SYNTAX 
    /scripts/sys/create_user_docker.sh user user_id [password] 

ARGUMENTS
    user: user name (which cannot be an empty string)
    user_id: user ID (which cannot be an empty string)
    password: Optional password (cannot be empty) of the user. 
        If not provided, then the user name is used as the password.

DESCRIPTION
    Create a new user with the group name "docker".

EOF
}

function create_user_docker() {
    if [[ $1 == "-h" ]]; then
        create_user_docker.usage
        return 0
    fi
    if [[ $# < 2 || $# > 3 ]]; then
        create_user_docker.usage
        return 1
    fi
    local user=$1
    local user_id=$2
    local group=docker
    local password=${4:-$user}
    /scripts/sys/create_user_group.sh $user $user_id $group $password
}

if [[ "$0" == ${BASH_SOURCE[0]} ]]; then
    create_user_docker $@
fi
