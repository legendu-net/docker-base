FROM ubuntu:19.04

RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        sudo wajig \
        software-properties-common apt-transport-https \
        file zip \
        tzdata locales \
        bash-completion man-db \
        neovim git openssh-client \
        rsync curl \
    && apt-get autoremove -y \
    && apt-get clean -y

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
