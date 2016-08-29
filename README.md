Minimal Node.js Docker Images (18MB, or 6.7MB compressed)
---------------------------------------------------------

Versions v6.5.0, v5.12.0, v4.5.0, v0.12.15, v0.10.46, and io.js –
built on [Alpine Linux](https://alpinelinux.org/).

*NB: All images were recently updated to [Alpine 3.4](https://alpinelinux.org/posts/Alpine-3.4.0-released.html) –
there shouldn't be any breaking changes unless you rely on other apk packages. `php` has been
renamed to `php5`, `cron` to `crond` and most `ruby-` pkgs have been removed in favor of `gem`*

All versions use the one [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node/) repository,
but each version aligns with the following tags (ie, `mhart/alpine-node:<tag>`). The sizes are for the
*unpacked* images as reported by Docker – compressed sizes are about 1/3 of these:

- Full install built with npm:
  - `latest`, `6`, `6.5`, `6.5.0` – 49.32 MB (npm 3.10.6)
  - `5`, `5.12`, `5.12.0` – 37.63 MB (npm 3.10.3)
  - `4`, `4.5`, `4.5.0` – 36.84 MB (npm 2.15.10)
  - `0.12`, `0.12.15` – 32.8 MB (npm 2.15.9)
  - `0.10`, `0.10.46` – 28.25 MB (npm 2.15.9)
- Base install with node built as a static binary with no npm:
  - `base`, `base-6`, `base-6.3`, `base-6.5.0` – 38.18 MB
  - `base-5`, `base-5.12`, `base-5.12.0` – 27.64 MB
  - `base-4`, `base-4.5`, `base-4.5.0` – 27.92 MB
  - `base-0.12`, `base-0.12.15` – 24.14 MB
  - `base-0.10`, `base-0.10.46` – 18.3 MB

Major io.js versions [are tagged too](https://hub.docker.com/r/mhart/alpine-node/tags/).

Examples
--------

    $ docker run mhart/alpine-node node --version
    v6.5.0

    $ docker run mhart/alpine-node npm --version
    3.10.6

    $ docker run mhart/alpine-node:5 node --version
    v5.12.0

    $ docker run mhart/alpine-node:4 node --version
    v4.5.0

    $ docker run mhart/alpine-node:base node --version
    v6.5.0

    $ docker run mhart/alpine-node:base-0.10 node --version
    v0.10.46

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
expecting glibc-like behavior – especially if you try to use binaries compiled
with glibc. You should recompile these binaries to use musl (compiling on
Alpine is probably the easiest way to do this).

Inspired by:

- https://github.com/alpinelinux/aports/blob/454db196/main/nodejs/APKBUILD
- https://github.com/alpinelinux/aports/blob/454db196/main/libuv/APKBUILD
- https://hub.docker.com/r/ficusio/nodejs-base/~/dockerfile/
