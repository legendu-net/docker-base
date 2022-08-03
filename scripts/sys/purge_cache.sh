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

# purge conda cache
if [[ "$(which conda)" != "" ]]; then
    conda clean --all --yes
fi

# purge npm cache 
if [[ "$(which npm)" != "" ]]; then
    npm cache clean --force
fi

# purge cargo cache
if [[ "$(which cargo-cache)" != "" ]]; then
    cargo-cache --autoclean
elif [[ -f /root/.cargo/bin/cargo-cache ]]; then
    /root/.cargo/bin/cargo-cache --autoclean
elif [[ -f /usr/local/cargo/bin/cargo-cache ]]; then
    /usr/local/cargo/bin/cargo-cache --autoclean
elif [[ -f ~/.cargo/bin/cargo-cache ]]; then
    ~/.cargo/bin/cargo-cache --autoclean
fi

# purge Golang caches
if [[ "$GOPATH" != "" ]] && [[ -d "$GOPATH/pkg/mod/" ]]; then
    rm -rf "$GOPATH/pkg/mod/*"
fi
if [[ -d "$HOME/go/pkg/mod/" ]]; then
    rm -rf "$HOME/go/pkg/mod/"
fi

# manual remove temp dirs
rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* ~/.cache/

exit 0
