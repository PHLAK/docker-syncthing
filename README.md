docker-syncthing
================

Docker image for [Syncthing](https://syncthing.net) client/node.

[![](https://images.microbadger.com/badges/image/phlak/syncthing.svg)](http://microbadger.com/#/images/phlak/syncthing "Get your own image badge on microbadger.com")

Running the Container
---------------------

First create some named data volumes to hold the persistent data:

    docker volume create --name syncthing-config
    docker volume create --name syncthing-data

Then run the Syncthing client:

    docker run -d -p 8384:8384 -p 21025:21025/udp -p 22000:22000 -v syncthing-config:/etc/syncthing -v syncthing-data:/srv/storage --name syncthing-client phlak/syncthing

#### Optional arguments

`-v /local/somedir:/srv/storage/somedir` - Map a directory (i.e. /local/somedir) on the host OS to
                                           the running container.  This is useful for syncing files
                                           on the host system through the container. This replaces
                                           the `-v syncthing-data:/srv/storage` run argument.

`-e TZ=America/Phoenix` - Set the timezone for your server. You can find your timezone in this
                          [list of timezones](https://goo.gl/uy1J6q). Use the (case sensitive)
                          value from the `TZ` column. If left unset, timezone will be UTC.

`--restart unless-stopped` - Always restart the container regardless of the exit status, but do not
                             start it on daemon startup if the container has been put to a stopped
                             state before. See the Docker [restart policies](https://goo.gl/Y0dlDH)
                             for additional details.

Troubleshooting
---------------

Please report bugs to the [GitHub Issue Tracker](https://github.com/PHLAK/docker-syncthing/issues).

Copyright
---------

This project is liscensed under the [MIT License](https://github.com/PHLAK/docker-syncthing/blob/master/LICENSE).
