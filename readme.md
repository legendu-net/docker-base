# dclong/base [@DockerHub](https://hub.docker.com/r/dclong/base/) | [@GitHub](https://github.com/dclong/docker-base)

Base Docker images.

## Prerequisite
You need to [install Docker](http://www.legendu.net/en/blog/docker-installation/) before you use this Docker image.

## Tags

<table style="width:100%">
  <tr>
    <th>Branch</th>
    <th>Linux</th>
    <th>Docker</th>
  </tr>
  <tr>
    <td>main</td>
    <td>Ubuntu 20.04</td>
    <td>dclong/base</td>
  </tr>
  <tr>
    <td>dev</td>
    <td>Ubuntu 20.04</td>
    <td>dclong/base:next</td>
  </tr>
  <tr>
    <td>21.10</td>
    <td>Ubuntu 21.10</td>
    <td>dclong/base:21.10</td>
  </tr>
  <tr>
    <td>debian</td>
    <td>Debian Testing</td>
    <td>dclong/base:debian</td>
  </tr>
  <tr>
    <td>centos7.6</td>
    <td>CentOS 7.6</td>
    <td>dclong/base:centos7.6</td>
  </tr>
</table>

## Usage in Linux/Unix

Please refer to the Section
[Usage](http://www.legendu.net/en/blog/my-docker-images/#usage)
of the post [My Docker Images](http://www.legendu.net/en/blog/my-docker-images/) 
for detailed instruction on how to use the Docker image.

The following command starts a container 
and mounts the current working directory and `/home` on the host machine 
to `/workdir` and `/home_host` in the container respectively.
```
docker run -it --init \
    --hostname ubuntu_b \
    --log-opt max-size=50m \
    -e DOCKER_USER=$(id -un) \
    -e DOCKER_USER_ID=$(id -u) \
    -e DOCKER_PASSWORD=$(id -un) \
    -e DOCKER_GROUP_ID=$(id -g) \
    -v $(pwd):/workdir \
    -v $(dirname $HOME):/home_host \
    dclong/base /bin/bash --init-file /scripts/sys/user.sh
```
The following command (*only works on Linux*) does the same as the above one 
except that it limits the use of CPU and memory.
```
docker run -it --init \
    --hostname ubuntu_b \
    --log-opt max-size=50m \
    --memory=$(($(head -n 1 /proc/meminfo | awk '{print $2}') * 4 / 5))k \
    --cpus=$(($(nproc) - 1)) \
    -e DOCKER_USER=$(id -un) \
    -e DOCKER_USER_ID=$(id -u) \
    -e DOCKER_PASSWORD=$(id -un) \
    -e DOCKER_GROUP_ID=$(id -g) \
    -v $(pwd):/workdir \
    -v $(dirname $HOME):/home_host \
    dclong/base /bin/bash --init-file /scripts/sys/user.sh
```
## [Log Information](http://www.legendu.net/en/blog/my-docker-images/#docker-container-logs)

## [Detailed Information](http://www.legendu.net/en/blog/my-docker-images/#list-of-images-and-detailed-information) 

## [Known Issues](http://www.legendu.net/en/blog/my-docker-images/#known-issues)

## [About the Author](http://www.legendu.net/pages/about)
