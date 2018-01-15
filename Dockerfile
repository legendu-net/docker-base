FROM ubuntu:16.04

RUN apt-get update -y \
    && apt-get install -y \
        sudo \
        wajig software-properties-common apt-transport-https \
        vim git colordiff \
        gcc cmake \
        wget curl
        
RUN apt-get update -y \
    && apt-get install -y 
        lsb_release
    && apt-get autoremove -y \
    && apt-get autoclean -y

COPY scripts /scripts
