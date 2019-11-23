#!/usr/bin/env bash

function run_scripts_etc.usage() {
    cat << EOF
Run scripts in /scripts/etc which are for automatic configurations in Docker container.
Syntax: run_scripts_etc [upper_index]
Argument:
    upper_index: The maximum index of scripts to run.
EOF
}

function run_scripts_etc() {
    if [ "$1" == "-h" ]; then
        run_scripts_etc.usage
        return 0
    fi
    local upper_index=${0:999}
    for script in $(ls /scripts/etc/[0-9][0-9][0-9]-*.sh); do
        index=${script:13:3}
        if [[ index <= upper_index ]]; then
            source $script
        fi
    done
}

if [ "$0" == ${BASH_SOURCE[0]} ]; then
    run_scripts_etc $@
fi
