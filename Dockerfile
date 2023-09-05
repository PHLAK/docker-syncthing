ARG BASE_IMAGE=docker.io/alpine:3.18.3

# ----------------------------------------
# Download and extract Syncthing binary
# ----------------------------------------

FROM ${BASE_IMAGE} as base

ARG ST_VERSION=1.23.7
ARG TARBALL_URL=https://github.com/syncthing/syncthing/releases/download/v${ST_VERSION}/syncthing-linux-386-v${ST_VERSION}.tar.gz

RUN apk add --no-cache ca-certificates tar tzdata wget
RUN wget --quiet --output-document - ${TARBALL_URL} | tar --extract --gzip --strip-components=1 \
    --directory /usr/local/bin syncthing-linux-386-v${ST_VERSION}/syncthing

# ----------------------------------------
# Build the image from the 'base' image
# ----------------------------------------

FROM ${BASE_IMAGE}
LABEL maintainer="Chris Kankiewicz <Chris@ChrisKankiewicz.com>"

ENV STGUIADDRESS 0.0.0.0:8384
ENV STHOMEDIR /etc/syncthing
ENV STNODEFAULTFOLDER true
ENV STNORESTART true
ENV STNOUPGRADE true

EXPOSE 8384 22000/tcp 22000/udp 21027/udp

RUN adduser -DHs /sbin/nologin syncthing
RUN mkdir -p /etc/syncthing /vol/storage && chown -R syncthing:syncthing /etc/syncthing /vol/storage

RUN apk add --no-cache ca-certificates tzdata
COPY --from=base /usr/local/bin/syncthing /usr/local/bin/syncthing

USER syncthing
VOLUME /etc/syncthing /vol/storage

CMD ["syncthing", "--no-browser"]
