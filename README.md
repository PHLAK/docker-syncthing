docker-syncthing
================

Docker container for Sytncthing client/node


### Running the container

**Create a data-only container:**

    docker create -v /srv/storage --name syncthing-data phlak/syncthing /bin/true

**Run the container:**

    docker run -d -p 8384:8384 -p 21025:21025 -p 22000:22000 --volumes-from syncthing-data --restart=always --name syncthing phlak/syncthing


### Upgrading Syncthing

To manually upgrade a running syncthing container to the latest version run the
following then restart your container:

    docker exec /srv/syncthing/syncthing -upgrade

**NOTE:** Requires the container to be restarted after running

-----

**Copyright (c) 2015 Chris Kankewicz <Chris@ChrisKankiewicz.com>**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
