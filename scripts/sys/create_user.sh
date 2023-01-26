#!/usr/bin/env bash

function create_user.usage() {
    cat << EOF
NAME
    /scripts/sys/create_user - create user in the Docker container

SYNTAX 
    /scripts/sys/create_user.sh user user_id password group group_id

ARGUMENTS
    user: user name (which cannot be an empty string)
    user_id: user ID (which cannot be an empty string)
    password: Optional password (cannot be empty) of the user. 
        If not provided, then the user name is used as the password.
    group: group name of the user (which cannot be an empty string)
    group_id: group ID (which cannot be an empty string)

DESCRIPTION
    Create a new user in the Docker container.

EOF
}

function create_user() {
    if [[ $1 == "-h" ]]; then 
        create_user.usage
        return 0
    fi
    if [[ $# != 5 ]]; then
        create_user.usage
        return 5
    fi
    local user=$1
    local user_id=$2
    local password=$3
    local group=$4
    local group_id=$5
    if [[ $user == "" || $user_id == "" || $password == "" || $group == "" || $group_id == "" ]]; then 
        create_user.usage
        return 1
    fi
    if [[ "$(getent group $group)" == "" ]]; then
        groupadd -o -g $group_id $group
    fi
    id $user > /dev/null 2>&1
    if [[ $? == 0 ]]; then
        echo "The user $user already exists!"
        return 0
    fi
    # the -l option below is to avoid huge lastlog file
    useradd -oml -u $user_id -g $group -d /home/$user -s /bin/bash -c "$user" $user
    su $user -c "mkdir -p ~/.local/bin/"
    echo $user:$password | chpasswd
}

if [[ "$0" == ${BASH_SOURCE[0]} ]]; then
    create_user $@
fi
