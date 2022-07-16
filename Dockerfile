# NAME: dclong/base
FROM ubuntu:22.04

SHELL ["/bin/bash", "-O", "extglob", "-c"]
RUN mkdir -p /workdir && chmod 777 /workdir
WORKDIR /workdir
COPY scripts /scripts

ARG URL=https://github.com/legendu-net/icon/releases
RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        sudo \
        software-properties-common apt-transport-https \
        file zip \
        tzdata locales \
        bash-completion man-db \
        neovim git openssh-client \
        rsync curl \
    && VERSION=$(basename $(curl -sL -o /dev/null -w %{url_effective} $URL/latest)) \
    && curl -sSL $URL/download/$VERSION/icon-$VERSION-linux-amd64.tar.gz -o /tmp/icon.tar.gz \
    && tar zxvf /tmp/icon.tar.gz -C /usr/local/bin/ \
    && chmod +x /usr/local/bin/icon \
    && echo "Set disable_coredump false" >> /etc/sudo.conf \
    && /scripts/sys/purge_cache.sh

# timezone
ARG TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
