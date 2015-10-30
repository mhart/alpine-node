Minimal Node.js Docker Images (18MB, or 6.6MB compressed)
---------------------------------------------------------

Versions v5.0.0, v4.2.1, v0.12.7, v0.10.40, and io.js – built on [Alpine Linux](https://alpinelinux.org/).

All versions use the one [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node/) repository,
but each version aligns with the following tags (ie, `mhart/alpine-node:<tag>`):

- Full install built with npm:
  - `latest`, `5`, `5.0`, `5.0.0` – 35.21 MB (npm 3.3.10)
  - `4`, `4.2`, `4.2.1` – 35.02 MB (npm 2.14.8)
  - `3`, `3.3`, `3.3.1` – 34.3 MB (npm 2.14.3)
  - `2`, `2.5`, `2.5.0` - 33.97 MB (npm 2.13.2)
  - `1`, `1.8`, `1.8.4` - 32.93 MB (npm 2.9.0)
  - `0.12`, `0.12.7` – 32.26 MB (npm 2.14.5)
  - `0.10`, `0.10.40` – 27.62 MB (npm 2.14.5)
- Base install with node built as a static binary with no npm:
  - `base`, `base-5`, `base-5.0`, `base-5.0.0` – 25.25 MB
  - `base-4`, `base-4.2`, `base-4.2.1` – 25.04 MB
  - `base-3`, `base-3.3`, `base-3.3.1` – 24.52 MB
  - `base-2`, `base-2.5`, `base-2.5.0` - 24.12 MB
  - `base-1`, `base-1.8`, `base-1.8.4` - 23.91 MB
  - `base-0.12`, `base-0.12.7` – 22.3 MB
  - `base-0.10`, `base-0.10.40` – 18.5 MB

Example
-------

    $ docker run mhart/alpine-node node --version
    v5.0.0

    $ docker run mhart/alpine-node:4 node --version
    v4.2.1

    $ docker run mhart/alpine-node npm --version
    3.3.10

    $ docker run mhart/alpine-node:base node --version
    v5.0.0

    $ docker run mhart/alpine-node:3 iojs --version
    v3.3.1

    $ docker run mhart/alpine-node:base-0.10 node --version
    v0.10.40

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
    # RUN apk add --update make gcc g++ python

    # If you need npm, don't use a base tag
    # RUN npm install

    # If you had native dependencies you can now remove build tools
    # RUN apk del make gcc g++ python && \
    #   rm -rf /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp

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
