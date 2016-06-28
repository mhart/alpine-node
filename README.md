Minimal Node.js Docker Images (18MB, or 6.7MB compressed)
---------------------------------------------------------

Versions v6.2.2, v5.12.0, v4.4.7, v0.12.15, v0.10.46, and io.js –
built on [Alpine Linux](https://alpinelinux.org/).

*NB: All images were recently updated to [Alpine 3.4](https://alpinelinux.org/posts/Alpine-3.4.0-released.html) –
there shouldn't be any breaking changes unless you rely on other apk packages. `php` has been
renamed to `php5`, `cron` to `crond` and most `ruby-` pkgs have been removed in favor of `gem`*

All versions use the one [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node/) repository,
but each version aligns with the following tags (ie, `mhart/alpine-node:<tag>`). The sizes are for the
*unpacked* images as reported by Docker – compressed sizes are about 1/3 of these:

- Full install built with npm:
  - `latest`, `6`, `6.2`, `6.2.2` – 46.22 MB (npm 3.9.6)
  - `5`, `5.12`, `5.12.0` – 38.28 MB (npm 3.9.6)
  - `4`, `4.4`, `4.4.7` – 36.98 MB (npm 2.15.8)
  - `0.12`, `0.12.15` – 33.58 MB (npm 2.15.8)
  - `0.10`, `0.10.46` – 29.03 MB (npm 2.15.8)
- Base install with node built as a static binary with no npm:
  - `base`, `base-6`, `base-6.2`, `base-6.2.2` – 35.09 MB
  - `base-5`, `base-5.12`, `base-5.12.0` – 28.29 MB
  - `base-4`, `base-4.4`, `base-4.4.6` – 27.88 MB
  - `base-0.12`, `base-0.12.15` – 24.79 MB
  - `base-0.10`, `base-0.10.46` – 18.28 MB

Major io.js versions [are tagged too](https://hub.docker.com/r/mhart/alpine-node/tags/).

Examples
--------

    $ docker run mhart/alpine-node node --version
    v6.2.2

    $ docker run mhart/alpine-node npm --version
    3.9.6

    $ docker run mhart/alpine-node:5 node --version
    v5.12.0

    $ docker run mhart/alpine-node:4 node --version
    v4.4.7

    $ docker run mhart/alpine-node:base node --version
    v6.2.2

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
