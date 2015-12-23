Minimal Node.js Docker Images (18MB, or 6.6MB compressed)
---------------------------------------------------------

Versions v5.3.0, v4.2.4, v0.12.9, v0.10.41, and io.js – built on [Alpine Linux](https://alpinelinux.org/).

All versions use the one [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node/) repository,
but each version aligns with the following tags (ie, `mhart/alpine-node:<tag>`):

- Full install built with npm (2.14.15 unless specified):
  - `latest`, `5`, `5.3`, `5.3.0` – 36.55 MB (npm 3.5.2)
  - `4`, `4.2`, `4.2.4` – 36.38 MB
  - `0.12`, `0.12.9` – 32.08 MB
  - `0.10`, `0.10.41` – 27.44 MB
- Base install with node built as a static binary with no npm:
  - `base`, `base-5`, `base-5.3`, `base-5.3.0` – 26.01 MB
  - `base-4`, `base-4.2`, `base-4.2.4` – 25.6 MB
  - `base-0.12`, `base-0.12.9` – 22.3 MB
  - `base-0.10`, `base-0.10.41` – 18.5 MB

Major io.js versions [are tagged too](https://hub.docker.com/r/mhart/alpine-node/tags/).

Example
-------

    $ docker run mhart/alpine-node node --version
    v5.3.0

    $ docker run mhart/alpine-node:4 node --version
    v4.2.4

    $ docker run mhart/alpine-node npm --version
    3.4.0

    $ docker run mhart/alpine-node:base node --version
    v5.3.0

    $ docker run mhart/alpine-node:3 iojs --version
    v3.3.1

    $ docker run mhart/alpine-node:base-0.10 node --version
    v0.10.41

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
