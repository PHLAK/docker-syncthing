FROM alpine:3.18.3
LABEL maintainer="Chris Kankiewicz <Chris@ChrisKankiewicz.com>"

ARG ST_VERSION=1.23.7

ENV STNODEFAULTFOLDER true
ENV STNOUPGRADE true

EXPOSE 8384 22000 21027/udp

RUN mkdir -p /etc/syncthing /vol/storage
RUN adduser -DHs /sbin/nologin syncthing

ARG TARBALL_URL=https://github.com/syncthing/syncthing/releases/download/v${ST_VERSION}/syncthing-linux-386-v${ST_VERSION}.tar.gz

RUN apk add --update ca-certificates tar tzdata wget \
    && wget -qO- ${TARBALL_URL} | tar --extract --gzip --strip-components=1 --directory /usr/local/bin syncthing-linux-386-v${ST_VERSION}/syncthing \
    && apk del tar wget && rm -rf /var/cache/apk/* \
    && chown -R syncthing:syncthing /etc/syncthing /vol/storage

USER syncthing

VOLUME /etc/syncthing /vol/storage

CMD ["syncthing", "-gui-address=0.0.0.0:8384", "-home=/etc/syncthing", "-no-browser"]
