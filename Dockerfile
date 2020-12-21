# NAME: dclong/ubuntu_b
FROM ubuntu:20.04

RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        sudo wajig \
        software-properties-common apt-transport-https \
        file zip \
        tzdata locales \
        bash-completion man-db \
        neovim git openssh-client \
        rsync curl \
    && echo "Set disable_coredump false" >> /etc/sudo.conf \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# timezone
ARG TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# create /workdir
RUN mkdir -p /workdir && chmod 777 /workdir

COPY scripts /scripts
