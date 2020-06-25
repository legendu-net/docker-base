#!/usr/bin/env bash

function run_scripts_etc.usage() {
    cat << EOF
NAME
    /scripts/sys/etc.sh - configuration for init

SYNTAX 
    /scripts/sys/etc.sh pre/post [upper_index]

ARGUMENT
    pre/post: Run scripts in /scripts/etc_pre or /scripts/etc_post respectively.
    upper_index: The maximum index of scripts to run.

DESCRIPTION
    Run scripts in /scripts/etc_pre or /scripts/etc_post 
    which are for automatic configurations in Docker container.

EOF
}

function run_scripts_etc() {
    if [ "$1" == "-h" ]; then
        run_scripts_etc.usage
        return 0
    fi
    local upper_index=9${2:-999}
    local script
    for script in $(ls /scripts/etc_$1/[0-9][0-9][0-9]-*.sh 2> /dev/null); do
        local index=$(basename $script)
        index=9${index:0:3}
        if [[ $index -le $upper_index ]]; then
            source $script
        fi
    done
}

if [ "$0" == ${BASH_SOURCE[0]} ]; then
    run_scripts_etc $@
fi
