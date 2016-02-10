Minimal Node.js Docker Images (18MB, or 6.6MB compressed)
---------------------------------------------------------

Versions v5.6.0, v4.3.0, v0.12.10, v0.10.42, and io.js – built on [Alpine Linux](https://alpinelinux.org/).

All versions use the one [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node/) repository,
but each version aligns with the following tags (ie, `mhart/alpine-node:<tag>`):

- Full install built with npm (2.14.18 unless specified):
  - `latest`, `5`, `5.6`, `5.6.0` – 37.61 MB (npm 3.7.1)
  - `4`, `4.3`, `4.3.0` – 36.71 MB
  - `0.12`, `0.12.10` – 33.48 MB
  - `0.10`, `0.10.42` – 28.92 MB
- Base install with node built as a static binary with no npm:
  - `base`, `base-5`, `base-5.6`, `base-5.6.0` – 28.21 MB
  - `base-4`, `base-4.3`, `base-4.3.0` – 27.75 MB
  - `base-0.12`, `base-0.12.10` – 24.81 MB
  - `base-0.10`, `base-0.10.42` – 18.5 MB

Major io.js versions [are tagged too](https://hub.docker.com/r/mhart/alpine-node/tags/).

Example
-------

    $ docker run mhart/alpine-node node --version
    v5.6.0

    $ docker run mhart/alpine-node:4 node --version
    v4.3.0

    $ docker run mhart/alpine-node npm --version
    3.7.1

    $ docker run mhart/alpine-node:base node --version
    v5.6.0

    $ docker run mhart/alpine-node:3 iojs --version
    v3.3.1

    $ docker run mhart/alpine-node:base-0.10 node --version
    v0.10.42

Example Dockerfile for your own Node.js project
-----------------------------------------------

If you don't have any native dependencies, ie only depend on pure-JS npm
modules, then my suggestion is to run `npm install` locally *before* running
`docker build` (and make sure `node_modules` isn't in your `.dockerignore`) –
then you don't need an `npm install` step in your Dockerfile and you don't need
`npm` installed in your Docker image – so you can use one of the smaller
`base*` images.

    FROM mhart/alpine-node:base
    # FROM mhart/alpine-node:base-0.10
    # FROM mhart/alpine-node

    WORKDIR /src
    ADD . .

    # If you have native dependencies, you'll need extra tools
    # RUN apk add --no-cache make gcc g++ python

    # If you need npm, don't use a base tag
    # RUN npm install

    EXPOSE 3000
    CMD ["node", "index.js"]

Caveats
-------

As Alpine Linux uses musl, you may run into some issues with environments
expecting glibc-like behaviour (for example, Kubernetes). Some of these issues
are documented here:

- http://gliderlabs.viewdocs.io/docker-alpine/caveats/
- https://github.com/gliderlabs/docker-alpine/issues/8

Inspired by:

- https://github.com/alpinelinux/aports/blob/454db196/main/nodejs/APKBUILD
- https://github.com/alpinelinux/aports/blob/454db196/main/libuv/APKBUILD
- https://hub.docker.com/r/ficusio/nodejs-base/~/dockerfile/
