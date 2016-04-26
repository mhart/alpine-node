Minimal Node.js Docker Images (18MB, or 6.7MB compressed)
---------------------------------------------------------

Versions v6.0.0, v5.11.0, v4.4.3, v0.12.13, v0.10.44, and io.js –
built on [Alpine Linux](https://alpinelinux.org/).

All versions use the one [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node/) repository,
but each version aligns with the following tags (ie, `mhart/alpine-node:<tag>`):

- Full install built with npm:
  - `latest`, `6`, `6.0`, `6.0.0` – 39.76 MB (npm 3.8.7)
  - `5`, `5.11`, `5.11.0` – 37.51 MB (npm 3.8.6)
  - `4`, `4.4`, `4.4.3` – 36.8 MB (npm 2.15.3)
  - `0.12`, `0.12.13` – 32.89 MB (npm 2.15.3)
  - `0.10`, `0.10.44` – 28.33 MB (npm 2.15.3)
- Base install with node built as a static binary with no npm:
  - `base`, `base-5`, `base-5.11`, `base-5.11.0` – 28.15 MB
  - `base-4`, `base-4.4`, `base-4.4.3` – 27.75 MB
  - `base-0.12`, `base-0.12.13` – 24.14 MB
  - `base-0.10`, `base-0.10.44` – 18.31 MB

Major io.js versions [are tagged too](https://hub.docker.com/r/mhart/alpine-node/tags/).

Examples
--------

    $ docker run mhart/alpine-node node --version
    v6.0.0

    $ docker run mhart/alpine-node npm --version
    3.8.7

    $ docker run mhart/alpine-node:5 node --version
    v5.11.0

    $ docker run mhart/alpine-node:4 node --version
    v4.4.3

    $ docker run mhart/alpine-node:base node --version
    v6.0.0

    $ docker run mhart/alpine-node:base-0.10 node --version
    v0.10.44

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
