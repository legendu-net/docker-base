#!/bin/bash

# purge apt-get cache
if [[ "$(which apt-get)" != "" ]]; then
    apt-get autoremove -y
    apt-get clean -y
fi

# purge pip cache
for cmd in python python3 python3.7; do
    if [[ "$(which $cmd)" != "" ]]; then
        $cmd -m pip cache purge -qqq
    fi
done

# purge npm cache 
if [[ "$(which npm)" != "" ]]; then
    npm cache clean --force
fi

# purge cargo cache
if [[ "$(which cargo-cache)" != "" ]]; then
    cargo-cache --autoclean
elif [[ "$(which ~/.cargo/bin/cargo-cache)" != "" ]]; then
    ~/.cargo/bin/cargo-cache --autoclean
elif [[ "$(which /root/.cargo/bin/cargo-cache)" != "" ]]; then
    /root/.cargo/bin/cargo-cache --autoclean
fi

# manual remove temp dirs
rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

exit 0
