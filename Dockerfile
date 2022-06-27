# NAME: dclong/base
FROM ubuntu:22.04

SHELL ["/bin/bash", "-O", "extglob", "-c"]
RUN mkdir -p /workdir && chmod 777 /workdir
WORKDIR /workdir
COPY scripts /scripts

RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        sudo \
        software-properties-common apt-transport-https \
        file zip \
        tzdata locales \
        bash-completion man-db \
        neovim git openssh-client \
        rsync curl \
    && curl -sSL https://github.com/legendu-net/icon/releases/download/v0.1.0/icon_linux_amd64 -o /usr/local/bin/icon \
    && echo "Set disable_coredump false" >> /etc/sudo.conf \
    && /scripts/sys/purge_cache.sh

# timezone
ARG TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
