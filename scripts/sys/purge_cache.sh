#!/bin/bash

# purge pip cache
if [[ "$(which python)" != "" ]]; then
    python -m pip cache purge -qqq
fi
if [[ "$(which python3)" != "" ]]; then
    python3 -m pip cache purge -qqq
fi
if [[ "$(which python3.7)" != "" ]]; then
    python3.7 -m pip cache purge -qqq
fi

# purge npm cache 
if [[ "$(which python)" != "" ]]; then
    npm cache clean --force
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
