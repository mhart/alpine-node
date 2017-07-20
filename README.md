Minimal Node.js Docker Images
-----------------------------

Versions v8.2.0, v6.11.1, v4.8.4, v0.12.18 and v0.10.48 –
built on [Alpine Linux](https://alpinelinux.org/).

All versions use the one [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node/) repository,
but each version aligns with the following tags (ie, `mhart/alpine-node:<tag>`). The sizes are for the
*unpacked* images as reported by Docker – compressed sizes are about 1/3 of these:

- Full install built with npm and yarn:
  - `latest`, `8`, `8.2`, `8.2.0` – 63.3 MB (npm 5.3.0, yarn 0.27.5)
- Full install build with npm:
  - `6`, `6.11`, `6.11.1` – 48.7 MB (npm 3.10.10)
  - `4`, `4.8`, `4.8.4` – 35.2 MB (npm 2.15.12)
  - `0.12`, `0.12.18` – 33.36 MB (npm 2.15.11)
  - `0.10`, `0.10.48` – 28.16 MB (npm 2.15.11)
- Base install with node built as a static binary with no npm or yarn:
  - `base`, `base-8`, `base-8.1`, `base-8.1.4` – 43.4 MB
  - `base-6`, `base-6.11`, `base-6.11.1` – 37.2 MB
  - `base-4`, `base-4.8`, `base-4.8.4` – 26.6 MB
  - `base-0.12`, `base-0.12.18` – 24.72 MB
  - `base-0.10`, `base-0.10.48` – 18.22 MB

Major io.js versions [are tagged too](https://hub.docker.com/r/mhart/alpine-node/tags/).

Examples
--------

    $ docker run mhart/alpine-node node --version
    v8.2.0

    $ docker run mhart/alpine-node npm --version
    5.3.0

    $ docker run mhart/alpine-node yarn --version
    0.27.5

    $ docker run mhart/alpine-node:6 node --version
    v6.11.1

    $ docker run mhart/alpine-node:base node --version
    v8.1.4

    $ docker run mhart/alpine-node:base-0.10 node --version
    v0.10.48

Example Dockerfile for your own Node.js project
-----------------------------------------------

If you don't have any native dependencies, ie only depend on pure-JS npm
modules, then my suggestion is to run `npm install` locally *before* running
`docker build` (and make sure `node_modules` isn't in your `.dockerignore`) –
then you don't need an `npm install` step in your Dockerfile and you don't need
`npm` installed in your Docker image – so you can use one of the smaller
`base*` images.

    FROM mhart/alpine-node:base-6
    # FROM mhart/alpine-node:6

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
expecting glibc-like behavior – especially if you try to use binaries compiled
with glibc. You should recompile these binaries to use musl (compiling on
Alpine is probably the easiest way to do this).

Inspired by:

- https://github.com/alpinelinux/aports/blob/454db196/main/nodejs/APKBUILD
- https://github.com/alpinelinux/aports/blob/454db196/main/libuv/APKBUILD
- https://hub.docker.com/r/ficusio/nodejs-base/~/dockerfile/
