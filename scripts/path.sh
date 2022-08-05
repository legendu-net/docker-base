#!/usr/bin/env bash

# set $PATH
_PATHS=(
    $(ls -d $HOME/*/bin 2> /dev/null)
    $(ls -d $HOME/.*/bin 2> /dev/null)
    $(ls -d $HOME/Library/Python/3.*/bin 2> /dev/null)
    $(ls -d /usr/local/*/bin 2> /dev/null)
)
for ((_i=${#_PATHS[@]}-1; _i>=0; _i--)); do
    _PATH=${_PATHS[$_i]}
    if [[ -d $_PATH && ! "$PATH" =~ (^$_PATH:)|(:$_PATH:)|(:$_PATH$) ]]; then
        export PATH=$_PATH:$PATH
    fi
done
