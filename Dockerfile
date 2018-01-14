FROM ubuntu:16.04

RUN apt-get update -y \
    && apt-get install -y \
        sudo \
        wajig software-properties-common apt-transport-https \
        lsb_release \
        vim git colordiff \
        gcc cmake \
        wget curl \
    && apt-get autoremove -y \
    && apt-get autoclean -y

COPY scripts /scripts
