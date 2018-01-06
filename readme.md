# [dclong/ubuntu_b](https://hub.docker.com/r/dclong/ubuntu_b/)

Ubuntu with basic utils in Docker.

## About the Author

[Personal Blog](http://www.legendu.net)   |   [GitHub](https://github.com/dclong)   |   [Bitbucket](https://bitbucket.org/dclong/)   |   [LinkedIn](http://www.linkedin.com/in/ben-chuanlong-du-1239b221/)

## Details

OS: Ubuntu LTS

### Additional Docker Environment Variables

If you have (or inherit) `ENTRYPOINT ["/scripts/init.sh"]`
as the last line in your Dockerfile, 
there are 3 additional Docker environment variables 
that you can use. 

`DOCKER_USER`: the user to create in the Docker container.

`DOCKER_USER_ID`: the ID of the user.

`DOCKER_GROUP_ID`: the group ID of the user.

`DOCKER_PASSWORD`: the password of the user.

## Usage in Linux/Unix

```
docker run -it \
    --log-opt max-size=50m \
    dclong/ubuntu_b
```
