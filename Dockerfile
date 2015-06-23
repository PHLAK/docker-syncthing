FROM ubuntu:14.04
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

## Set syncthing directories
ENV ST_APP  /opt/syncthing
ENV ST_HOME /etc/syncthing
ENV ST_DATA /srv/storage

## Set syncthing gui port
ENV ST_GUI_PORT 8384

## Upgrade packages and install dependencies
RUN apt-get update && apt-get -y upgrade \
    && apt-get -y install wget jq \
    && rm -rf /var/lib/apt/lists/*

## Create syncthing directories
RUN mkdir -p ${ST_APP} ${ST_HOME} ${ST_DATA}

## Install syncthing
RUN ST_VERSION=$(wget -qO- https://api.github.com/repos/syncthing/syncthing/releases | jq -r '.[0].tag_name') \
    && wget -qO- https://github.com/syncthing/syncthing/releases/download/${ST_VERSION}/syncthing-linux-amd64-${ST_VERSION}.tar.gz \
    | tar -xz --strip-components=1 -C ${ST_APP}

## Expose ports
EXPOSE ${ST_GUI_PORT} 21025/udp 22000

## Create volumes
VOLUME ${ST_HOME} ${ST_DATA}

## Set command
CMD ${ST_APP}/syncthing -gui-address=0.0.0.0:${ST_GUI_PORT} -home=${ST_HOME} -no-browser
