#!/bin/bash

# purge pip cache
if [[ "$(which pip3)" != "" ]]; then
    pip3 cache purge -qqq
fi
if [[ "$(which pip)" != "" ]]; then
    pip cache purge -qqq
fi

# purge apt-get cache
if [[ "$(which apt-get)" != "" ]]; then
    apt-get autoremove -y
    apt-get clean -y
fi

# purge cargo cache
if [[ "$(which cargo-cache)" != "" ]]; then
    cargo-cache --autoclean
fi

# manual remove temp dirs
rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

exit 0
