FROM ubuntu

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

RUN mkdir -p /workdir && chmod 777 /workdir

COPY scripts /scripts

ENTRYPOINT ["/scripts/init.sh"]
