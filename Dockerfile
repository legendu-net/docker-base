# NAME: dclong/base
FROM ubuntu:22.04

# shell
SHELL ["/bin/bash", "-O", "extglob", "-c"]
ENV HISTTIMEFORMAT="[%F %T %z]"

RUN mkdir -p /workdir && chmod 777 /workdir
WORKDIR /workdir
COPY scripts /scripts

RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        sudo \
        pkg-config software-properties-common apt-transport-https \
        file zip \
        tzdata locales \
        bash-completion man-db \
        git openssh-client \
        rsync curl \
    && curl -sSL https://raw.githubusercontent.com/legendu-net/icon/main/install_icon.sh | bash \
    && icon neovim -iy \
    && echo "Set disable_coredump false" >> /etc/sudo.conf \
    && /scripts/sys/purge_cache.sh

# timezone
ARG TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
