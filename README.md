Minimal Node/io.js Docker Images (18MB, or 6.6MB compressed)
------------------------------------------------------------

Versions v4.0.0, v0.12.7, v0.10.40, and io.js v3.3.0 –
built on [Alpine Linux](http://alpinelinux.org/).

Each comes in two flavours: a full install built with npm, and a base install
with Node/io.js built as a static binary with no npm:

- [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node/) (with npm 2.14.2)
  - latest, 4.0, 4.0.0 – 32.25 MB
  - 0.12, 0.12.7 – 32.25 MB
  - 0.10, 0.10.40 – 27.61 MB
- [mhart/alpine-node-base](https://hub.docker.com/r/mhart/alpine-node-base/) (static, without npm)
  - latest, 4.0, 4.0.0 – 22.25 MB
  - 0.12, 0.12.7 – 22.25 MB
  - 0.10, 0.10.40 – 18.48 MB
- [mhart/alpine-iojs](https://hub.docker.com/r/mhart/alpine-iojs/) (with npm 2.13.3)
  - latest, 3, 3.3, 3.3.0 – 34.39 MB
  - 2, 2.5, 2.5.0
  - 1, 1.8, 1.8.4
- [mhart/alpine-iojs-base](https://hub.docker.com/r/mhart/alpine-iojs-base/) (static, without npm)
  - latest, 3, 3.3, 3.3.0 – 24.5 MB
  - 2, 2.5, 2.5.0
  - 1, 1.8, 1.8.4

Example
-------

    $ docker run mhart/alpine-node-base node --version
    v4.0.0

    $ docker run mhart/alpine-iojs-base node --version
    v3.3.0

    $ docker run mhart/alpine-node-base:0.10 node --version
    v0.10.40

    $ docker run mhart/alpine-node npm --version
    2.14.2

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
    # FROM mhart/alpine-node

    WORKDIR /src
    ADD . .

    # If you have native dependencies, you'll need extra tools
    # RUN apk add --update make gcc g++ python

    # If you need npm, use mhart/alpine-node or mhart/alpine-iojs
    # RUN npm install

    # If you had native dependencies you can now remove build tools
    # RUN apk del make gcc g++ python && \
    #   rm -rf /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp

    EXPOSE 3000
    CMD ["node", "index.js"]

Inspired by:

- http://git.alpinelinux.org/cgit/aports/tree/main/nodejs/APKBUILD
- http://git.alpinelinux.org/cgit/aports/tree/main/libuv/APKBUILD
- https://registry.hub.docker.com/u/ficusio/nodejs-base/dockerfile/
