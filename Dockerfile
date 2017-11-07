FROM ubuntu:16.04

RUN apt-get update -y \
    && apt-get install -y \
        sudo \
        wajig software-properties-common apt-transport-https \
        vim git colordiff \
        gcc cmake \
        wget \
    && apt-get autoremove -y \
    && apt-get autoclean -y
