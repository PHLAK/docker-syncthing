docker-syncthing
================

<p align="center">
    <img src="docker-syncthing.png" alt="Docker Syncthing" width="500">
<p>

<p align="center">
  <a href="http://microbadger.com/#/images/phlak/syncthing" alt="Microbadger"><img src="https://images.microbadger.com/badges/image/phlak/syncthing.svg"></a>
  <a href="https://join.slack.com/t/phlaknet/shared_invite/enQtNzk0ODkwMDA2MDg0LWI4NDAyZGRlMWEyMWNhZmJmZjgzM2Y2YTdhNmZlYzc3OGNjZWU5MDNkMTcwMWQ5OGI5ODFmMjI5OWVkZTliN2M"><img src="https://img.shields.io/badge/Join_our-Slack-611f69.svg" alt="Join our"></a>
  <a href="https://github.com/users/PHLAK/sponsorship"><img src="https://img.shields.io/badge/Become_a-Sponsor-cc4195.svg" alt="Become a Sponsor"></a>
  <a href="https://patreon.com/PHLAK"><img src="https://img.shields.io/badge/Become_a-Patron-e7513b.svg" alt="Become a Patron"></a>
  <a href="https://paypal.me/ChrisKankiewicz"><img src="https://img.shields.io/badge/Make_a-Donation-006bb6.svg" alt="One-time Donation"></a>
</p>

<p align="center">
    Docker image for <a href="https://syncthing.net">Syncthing</a> client/node.
</p>

---

Running the Container
---------------------

First create some named data volumes to hold the persistent data:

    docker volume create --name syncthing-config
    docker volume create --name syncthing-data

Then run the Syncthing client:

    docker run -d -p 8384:8384 -p 21025:21025/udp -p 22000:22000 -v syncthing-config:/etc/syncthing -v syncthing-data:/vol/storage --name syncthing-client phlak/syncthing

#### Optional arguments

`-v /local/somedir:/vol/storage/somedir` - Map a directory (i.e. /local/somedir) on the host OS to
                                           the running container.  This is useful for syncing files
                                           on the host system through the container. This replaces
                                           the `-v syncthing-data:/vol/storage` run argument.

`-e TZ=America/Phoenix` - Set the timezone for your server. You can find your timezone in this
                          [list of timezones](https://goo.gl/uy1J6q). Use the (case sensitive)
                          value from the `TZ` column. If left unset, timezone will be UTC.

`--restart unless-stopped` - Always restart the container regardless of the exit status, but do not
                             start it on daemon startup if the container has been put to a stopped
                             state before. See the Docker [restart policies](https://goo.gl/Y0dlDH)
                             for additional details.

Troubleshooting
---------------

For general help and support join our [Slack Workspace](https://join.slack.com/t/phlaknet/shared_invite/enQtNzk0ODkwMDA2MDg0LWI4NDAyZGRlMWEyMWNhZmJmZjgzM2Y2YTdhNmZlYzc3OGNjZWU5MDNkMTcwMWQ5OGI5ODFmMjI5OWVkZTliN2M).

Please report bugs to the [GitHub Issue Tracker](https://github.com/PHLAK/docker-syncthing/issues).

Copyright
---------

This project is licensed under the [MIT License](https://github.com/PHLAK/docker-syncthing/blob/master/LICENSE).
