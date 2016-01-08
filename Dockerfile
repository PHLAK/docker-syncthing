FROM alpine:3.3
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

# Define Syncthing version
ENV ST_VERSION 0.12.11

# Create Syncthing directories
ENV ST_APP_DIR  /opt/syncthing
ENV ST_HOME_DIR /etc/syncthing
ENV ST_DATA_DIR /srv/storage
RUN mkdir -p ${ST_APP_DIR} ${ST_CONF_DIR} ${ST_DATA_DIR}

# Set tarball file URL
ENV TARBALL_URL https://github.com/syncthing/syncthing/releases/download/v${ST_VERSION}/syncthing-linux-386-v${ST_VERSION}.tar.gz

# Install dependencies
RUN apk add --update ca-certificates tar wget \
    && wget -qO- ${TARBALL_URL} | tar -xz --strip-components=1 -C ${ST_APP_DIR} \
    && apk del ca-certificates tar wget && rm -rf /var/cache/apk/*

# Expose ports
EXPOSE 8384 21025/udp 22000

# Create volumes
VOLUME ${ST_HOME_DIR} ${ST_DATA_DIR}

# Set command
CMD ${ST_APP_DIR}/syncthing -gui-address=0.0.0.0:8384 -home=${ST_HOME_DIR} -no-browser
