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

## Image Tree Related to [dclong/ubuntu_b](https://hub.docker.com/r/dclong/ubuntu_b/)

[dclong/ubuntu_b](https://hub.docker.com/r/dclong/ubuntu_b/)

- [dclong/conda](https://hub.docker.com/r/dclong/conda/)
    - [dclong/conda-yarn](https://hub.docker.com/r/dclong/conda-yarn/)
- [dclong/dlang](https://hub.docker.com/r/dclong/dlang/)
- [dclong/linuxbrew](https://hub.docker.com/r/dclong/linuxbrew/)
- [dclong/jdk](https://hub.docker.com/r/dclong/jdk/)
    - [dclong/scala](https://hub.docker.com/r/dclong/scala/)
        - [dclong/hadoop](https://hub.docker.com/r/dclong/hadoop/)
            - [dclong/hive](https://hub.docker.com/r/dclong/hive/)
                - [dclong/spark](https://hub.docker.com/r/dclong/spark/)
                    - [dclong/zeppelin](https://hub.docker.com/r/dclong/zeppelin/)
- [dclong/nodejs](https://hub.docker.com/r/dclong/nodejs/)
    - [dclong/typescript](https://hub.docker.com/r/dclong/typescript/)
- [dclong/r-base](https://hub.docker.com/r/dclong/r-base/)
    - [dclong/r-pop](https://hub.docker.com/r/dclong/r-pop/)
        - [dclong/rstudio](https://hub.docker.com/r/dclong/rstudio/)
- [dclong/proxychains](https://hub.docker.com/r/dclong/proxychains)
- [dclong/python](https://hub.docker.com/r/dclong/python/)
    - [dclong/dryscrape](https://hub.docker.com/r/dclong/dryscrape/)
    - [dclong/flask](https://hub.docker.com/r/dclong/flask/)
    - [dclong/jupyter](https://hub.docker.com/r/dclong/jupyter/)
        - [dclong/jupyter-beakerx](https://hub.docker.com/r/dclong/jupyter-beakerx/)
    - [dclong/bokeh](https://hub.docker.com/r/dclong/bokeh/)
    - [dclong/jupyterlab](https://hub.docker.com/r/dclong/jupyterlab/)
        - [dclong/jupyterlab-ts](https://hub.docker.com/r/dclong/jupyterlab-ts/)
        - [dclong/jupyterlab-js](https://hub.docker.com/r/dclong/jupyterlab-js/)
        - [dclong/jupyterlab-beakerx](https://hub.docker.com/r/dclong/jupyterlab-beakerx/)
        - [dclong/jupyterlab-tdodbc](https://hub.docker.com/r/dclong/jupyterlab-tdodbc/)
        - [dclong/jupyterlab-jdk](https://hub.docker.com/r/dclong/jupyterlab-jdk/)
            - [dclong/jupyterlab-scala](https://hub.docker.com/r/dclong/jupyterlab-scala/)
                - [dclong/jupyterlab-spark](https://hub.docker.com/r/dclong/jupyterlab-spark/)
            - [dclong/jupyterlab-antlr4](https://hub.docker.com/r/dclong/jupyterlab-antlr4/)
        - [dclong/jupyterlab-py](https://hub.docker.com/r/dclong/jupyterlab-py/)
        - [dclong/jupyterlab-rb](https://hub.docker.com/r/dclong/jupyterlab-rb/)
            - [dclong/jupyterlab-rp](https://hub.docker.com/r/dclong/jupyterlab-rp/)
                - [dclong/jupyterlab-rp-py](https://hub.docker.com/r/dclong/jupyterlab-rp-py/)
                - [dclong/jupyterlab-rstudio](https://hub.docker.com/r/dclong/jupyterlab-rstudio/)
                    - [dclong/jupyterlab-rstudio-py](https://hub.docker.com/r/dclong/jupyterlab-rstudio-py/)
                        - [dclong/jupyterlab-ds](https://hub.docker.com/r/dclong/jupyterlab-ds/)
                            - [dclong/jupyterhub-ds](https://hub.docker.com/r/dclong/jupyterhub-ds/)
- [dclong/samba](https://hub.docker.com/r/dclong/samba/)
- [dclong/tdodbc](https://hub.docker.com/r/dclong/tdodbc/)
    - [dclong/tdodbc-py](https://hub.docker.com/r/dclong/tdodbc-py/)
        - [dclong/tdodbc-jupyterlab](https://hub.docker.com/r/dclong/tdodbc-jupyterlab/)
- [dclong/ubuntu_cn](https://hub.docker.com/r/dclong/ubuntu_cn/)
    - [dclong/xubuntu](https://hub.docker.com/r/dclong/xubuntu/)
        - [dclong/xubuntu-atom](https://hub.docker.com/r/dclong/xubuntu-atom/)
        - [dclong/xubuntu-nodejs](https://hub.docker.com/r/dclong/xubuntu-nodejs/)
        - [dclong/xubuntu-jdk](https://hub.docker.com/r/dclong/xubuntu-jdk/)
            - [dclong/xubuntu-scala](https://hub.docker.com/r/dclong/xubuntu-scala/)
                - [dclong/xubuntu-intellij](https://hub.docker.com/r/dclong/xubuntu-intellij/)
        - [dclong/xubuntu-py](https://hub.docker.com/r/dclong/xubuntu-py/)
            - [dclong/xubuntu-pycharm](https://hub.docker.com/r/dclong/xubuntu-pycharm/)
