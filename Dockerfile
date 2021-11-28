# NAME: dclong/base
FROM centos:7.6.1810

WORKDIR /root
RUN mkdir -p /workdir && chmod 777 /workdir
COPY scripts /scripts

RUN yum install -y
        sudo \
        file zip \
        tzdata \
        man-db \
        neovim git openssh-client \
        rsync curl \
    && echo "Set disable_coredump false" >> /etc/sudo.conf \
    && /scripts/sys/purge_cache.sh

# timezone
ARG TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone
