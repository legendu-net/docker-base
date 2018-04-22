FROM ubuntu:16.04

RUN apt-get update -y \
    && apt-get install -y \
        sudo \
        wajig software-properties-common apt-transport-https \
        lsb-release \
        vim git colordiff \
        gcc cmake \
        wget curl \
        unzip bzip2 \
    && apt-get autoremove -y \
    && apt-get autoclean -y

COPY scripts /scripts

ENTRYPOINT ["/scripts/init.sh"]
