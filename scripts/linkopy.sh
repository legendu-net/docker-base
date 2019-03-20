#!/usr/bin/env bash

function copy_if_exists(){
    local src="$1"
    local des="${$2:-$HOME}"
    if [[ -e "$src" ]]; then
        cp -r "$src" "$des"
    fi
}

function link_if_exists(){
    local src="$1"
    local des="${$2:-$HOME}"
    if [[ -e "$src" ]]; then
        ln -svf "$src" "$des"
    fi
}

link_if_exists /home_host/$(id -un)/.jdbay_profile
copy_if_exists /home_host/$(id -un)/.proxychains
copy_if_exists /home_host/$(id -un)/.ssh

link_if_exists /home_host/$(id -un)/archives
link_if_exists $HOME/archives/config/linstall.ipy
link_if_exists /workdir/learning
