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
        echo "5 arguments are required while $# were provided!"
        return 5
    fi
    local user=$1
    local user_id=$2
    local password="$3"
    local group=$4
    local group_id=$5
    if [[ ! "$user" =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]; then 
        echo "'$user' is invalid for the user name (1st) argument!"
        return 1
    fi
    if [[ ! "$user_id" =~ ^[0-9]+$ ]]; then 
        echo "'$user_id' is invalid for the user id (2nd) argument!"
        return 1
    fi
    if [[ "$password" == "" ]]; then 
        echo "'$password' is invalid for the user password (3rd) argument!"
        return 1
    fi
    if [[ ! "$group" =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]; then 
        echo "'$group' is invalid for the user group name (4th) argument!"
        return 1
    fi
    if [[ ! "$group_id" =~ ^[0-9]+$ ]]; then 
        echo "'$group_id' is invalid for the user group id (5th) argument!"
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
    echo $user:"$password" | chpasswd
}

if [[ "$0" == ${BASH_SOURCE[0]} ]]; then
    create_user $@
fi
