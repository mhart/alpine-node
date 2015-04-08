Minimal Node.js Docker Images (20MB, or 7.5MB compressed)
---------------------------------------------------------

Versions v0.10.38, v0.12.2 and io.js v1.6.4 –
built on [Alpine Linux](http://alpinelinux.org/).

Each comes in two flavours: with and without npm:

- [mhart/alpine-node](https://registry.hub.docker.com/u/mhart/alpine-node/) (with npm 2.7.5)
  - latest, 0.12, 0.12.2
  - 0.10, 0.10.38
- [mhart/alpine-node-base](https://registry.hub.docker.com/u/mhart/alpine-node-base/) (without npm)
  - latest, 0.12, 0.12.2
  - 0.10, 0.10.38
- [mhart/alpine-iojs](https://registry.hub.docker.com/u/mhart/alpine-iojs/) (with npm 2.7.5)
  - latest, 1.6, 1.6.4
- [mhart/alpine-iojs-base](https://registry.hub.docker.com/u/mhart/alpine-iojs-base/) (without npm)
  - latest, 1.6, 1.6.4

Example
-------

```sh
$ docker run mhart/alpine-node-base node --version
v0.12.2

$ docker run mhart/alpine-node-base:0.10 node --version
v0.10.38

$ docker run mhart/alpine-node npm --version
2.7.5
```

Example Dockerfile for your own Node.js project
-----------------------------------------------

```docker
FROM mhart/alpine-node-base
# FROM mhart/alpine-node-base:0.10
# FROM mhart/alpine-iojs-base

WORKDIR /src
ADD . .

# If you need npm, use mhart/alpine-node or mhart/alpine-iojs
# RUN npm install

EXPOSE 3000
CMD ["node", "index.js"]
```

Inspired by:

- http://git.alpinelinux.org/cgit/aports/tree/main/nodejs/APKBUILD
- http://git.alpinelinux.org/cgit/aports/tree/main/libuv/APKBUILD
- https://registry.hub.docker.com/u/ficusio/nodejs-base/dockerfile/

