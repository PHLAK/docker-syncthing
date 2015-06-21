FROM ubuntu:14.04
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

## Set syncthing directory
ENV ST_DIR /srv/syncthing

## Set syncthing version
ENV ST_VERSION 0.11.9

## Upgrade packages and install dependencies
RUN apt-get update && apt-get -y upgrade \
    && apt-get -y install wget \
    && rm -rf /var/lib/apt/lists/*

## Create syncthing directories
RUN mkdir ${ST_DIR}

## Install syncthing
RUN wget -qO- https://github.com/syncthing/syncthing/releases/download/v${ST_VERSION}/syncthing-linux-amd64-v${ST_VERSION}.tar.gz \
    | tar -xz --strip-components=1 -C ${ST_DIR}

## Add run file
ADD /files/run.sh /run.sh
RUN chmod +x /run.sh

## Expose ports
EXPOSE 80 443 21025 22000

## Set command
CMD ["/run.sh"]
