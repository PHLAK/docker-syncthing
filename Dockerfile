FROM alpine:3.3
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

# Define Syncthing version
ENV ST_VERSION 0.12.12

# Disallow upgrading
ENV STNOUPGRADE true

# Create Syncthing directories
RUN mkdir -p /opt/syncthing /srv/storage

# Set tarball file URL
ENV TARBALL_URL https://github.com/syncthing/syncthing/releases/download/v${ST_VERSION}/syncthing-linux-386-v${ST_VERSION}.tar.gz

# Install dependencies
RUN apk add --update ca-certificates tar wget \
    && wget -qO- ${TARBALL_URL} | tar -xz --strip-components=1 -C /opt/syncthing \
    && apk del ca-certificates tar wget && rm -rf /var/cache/apk/*

# Expose ports
EXPOSE 8384 21025/udp 22000

# Create volumes
VOLUME /etc/syncthing /srv/storage

# Set command
CMD ["/opt/syncthing/syncthing", "-gui-address=0.0.0.0:8384", "-home=/etc/syncthing", "-no-browser"]
