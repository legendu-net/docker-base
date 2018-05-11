FROM ubuntu:16.04

RUN apt-get update -y \
    && apt-get install -y \
        sudo \
        wajig software-properties-common apt-transport-https \
        locales lsb-release \
        vim git colordiff \
        gcc cmake \
        wget curl \
        unzip bzip2 \
    && apt-get autoremove -y \
    && apt-get autoclean -y

RUN locale-gen en_US && locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 \
    && mkdir -p /workdir && chmod 777 /workdir

COPY scripts /scripts

ENTRYPOINT ["/scripts/init.sh"]
