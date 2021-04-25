docker-syncthing
================

<p align="center">
    <img src="docker-syncthing.png" alt="Docker Syncthing" width="500">
<p>

<p align="center">
    <a href="https://github.com/PHLAK/docker-syncthing/discussions"><img src="https://img.shields.io/badge/Join_the-Community-7b16ff.svg?style=for-the-badge" alt="Join the Community"></a>
    <a href="https://github.com/users/PHLAK/sponsorship"><img src="https://img.shields.io/badge/Become_a-Sponsor-cc4195.svg?style=for-the-badge" alt="Become a Sponsor"></a>
    <a href="https://paypal.me/ChrisKankiewicz"><img src="https://img.shields.io/badge/Make_a-Donation-006bb6.svg?style=for-the-badge" alt="One-time Donation"></a>
    <br>
    <a href="https://hub.docker.com/repository/docker/phlak/syncthing/tags"><img alt="Docker Image Version" src="https://img.shields.io/docker/v/phlak/syncthing?style=flat-square&sort=semver"></a>
    <a href="https://hub.docker.com/repository/docker/phlak/syncthing"><img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/phlak/syncthing?style=flat-square"></a>
    <a href="https://github.com/PHLAK/docker-syncthing/blob/master/LICENSE"><img src="https://img.shields.io/github/license/PHLAK/docker-syncthing?style=flat-square" alt="License"></a>
    <a href="https://hub.docker.com/repository/docker/phlak/syncthing/builds"><img alt="Docker Build Status" src="https://img.shields.io/docker/build/phlak/syncthing?style=flat-square"></a>
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

<dl>
  <dt><code>-v /local/somedir:/vol/storage/somedir</code></dt>
  <dd>Map a directory (i.e. <code>/local/somedir</code>) on the host OS to the running container.  This is useful for syncing files on the host system through the container. This replaces the <code>-v syncthing-data:/vol/storage</code> run argument.</dd>

  <dt><code>-e TZ=America/Phoenix</code></dt>
  <dd>Set the timezone for your server. You can find your timezone in this <a href="https://goo.gl/uy1J6q">list of timezones</a>. Use the (case sensitive) value from the <code>TZ</code> column. If left unset, timezone will be UTC.</dd>

  <dt><code>--restart unless-stopped</code></dt>
  <dd>Always restart the container regardless of the exit status, but do not start it on daemon startup if the container has been put to a stopped state before. See the Docker <a href="https://goo.gl/Y0dlDH">restart policies</a> for additional details.</dd>
</dl>

Troubleshooting
---------------

For general help and support join our [Spectrum Community](https://spectrum.chat/phlaknet) or reach out on [Twitter](https://twitter.com/PHLAK).

Please report bugs to the [GitHub Issue Tracker](https://github.com/PHLAK/docker-syncthing/issues).

Copyright
---------

This project is licensed under the [MIT License](https://github.com/PHLAK/docker-syncthing/blob/master/LICENSE).
