Minimal Node/io.js Docker Images (18MB, or 6.6MB compressed)
------------------------------------------------------------

Versions v0.10.39, v0.12.6 and io.js v2.3.4 –
built on [Alpine Linux](http://alpinelinux.org/).

Each comes in two flavours: a full install built with npm, and a base install
with Node/io.js built as a static binary with no npm:

- [mhart/alpine-node](https://registry.hub.docker.com/u/mhart/alpine-node/) (with npm 2.12.1)
  - latest, 0.12, 0.12.6 – 30.8 MB
  - 0.10, 0.10.39 – 26.15 MB
- [mhart/alpine-node-base](https://registry.hub.docker.com/u/mhart/alpine-node-base/) (static, without npm)
  - latest, 0.12, 0.12.6 – 22.25 MB
  - 0.10, 0.10.39 – 18.46 MB
- [mhart/alpine-iojs](https://registry.hub.docker.com/u/mhart/alpine-iojs/) (with npm 2.12.1)
  - latest, 2, 2.3, 2.3.4 – 34.03 MB
  - 1, 1.8, 1.8.3
- [mhart/alpine-iojs-base](https://registry.hub.docker.com/u/mhart/alpine-iojs-base/) (static, without npm)
  - latest, 2, 2.3, 2.3.4 – 24.11 MB
  - 1, 1.8, 1.8.3

Example
-------

    $ docker run mhart/alpine-node-base node --version
    v0.12.6

    $ docker run mhart/alpine-iojs-base node --version
    v2.3.4

    $ docker run mhart/alpine-node-base:0.10 node --version
    v0.10.39

    $ docker run mhart/alpine-node npm --version
    2.12.1

Example Dockerfile for your own Node.js project
-----------------------------------------------

If you don't have any native dependencies, ie only depend on pure-JS npm
modules, then my suggestion is to run `npm install` *before* running
`docker build` (and make sure `node_modules` isn't in your `.dockerignore`) –
then you don't need an `npm install` step in your Dockerfile and you don't need
`npm` installed in your Docker image – so you can use one of the smaller
`*-base` images.

    FROM mhart/alpine-node-base
    # FROM mhart/alpine-node-base:0.10
    # FROM mhart/alpine-iojs-base
    # FROM mhart/alpine-node

    WORKDIR /src
    ADD . .

    # If you have native dependencies, you'll need extra tools
    # RUN apk-install make gcc g++ python

    # If you need npm, use mhart/alpine-node or mhart/alpine-iojs
    # RUN npm install

    # If you had native dependencies you can now remove build tools
    # RUN apk del make gcc g++ python && \
    #   rm -rf /tmp/* /root/.npm /root/.node-gyp

    EXPOSE 3000
    CMD ["node", "index.js"]

Inspired by:

- http://git.alpinelinux.org/cgit/aports/tree/main/nodejs/APKBUILD
- http://git.alpinelinux.org/cgit/aports/tree/main/libuv/APKBUILD
- https://registry.hub.docker.com/u/ficusio/nodejs-base/dockerfile/
