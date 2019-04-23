Minimal Node.js Docker Images
-----------------------------

Versions v12.0.0, v10.15.3, v8.16.0, v6.17.1, v4.9.1, v0.12.18 and v0.10.48 –
built on [Alpine Linux](https://alpinelinux.org/).

All versions use the one [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node/) repository,
but each version aligns with the following tags (ie, `mhart/alpine-node:<tag>`). The sizes are for the
*unpacked* images as reported by Docker – compressed sizes are about 1/3 of these:

- Full install built with npm and yarn:
  - `latest`, `12`, `12.0`, `12.0.0` – 75.8 MB (npm 6.9.0, yarn 1.15.2)
  - `10`, `10.15`, `10.15.3` – 70.6 MB (npm 6.9.0, yarn 1.15.2)
  - `8`, `8.16`, `8.16.0` – 66 MB (npm 6.9.0, yarn 1.15.2)
- Full install build with npm:
  - `6`, `6.17`, `6.17.1` – 49 MB (npm 3.10.10)
  - `4`, `4.9`, `4.9.1` – 35.2 MB (npm 2.15.12)
  - `0.12`, `0.12.18` – 32.4 MB (npm 2.15.12)
  - `0.10`, `0.10.48` – 27.8 MB (npm 2.15.12)
- Base install with node built as a static binary with no npm or yarn:
  - `base-10`, `base-10.15`, `base-10.15.3` – 46.9 MB
  - `base-8`, `base-8.16`, `base-8.16.0` – 43.1 MB
  - `base-6`, `base-6.17`, `base-6.17.1` – 39.2 MB
  - `base-4`, `base-4.9`, `base-4.9.1` – 26.6 MB
  - `base-0.12`, `base-0.12.18` – 24.1 MB
  - `base-0.10`, `base-0.10.48` – 18.2 MB

Examples
--------

```console
$ docker run --rm mhart/alpine-node:12 node --version
v12.0.0

$ docker run --rm mhart/alpine-node:10 node --version
v10.15.3

$ docker run --rm mhart/alpine-node:12 npm --version
6.9.0

$ docker run --rm mhart/alpine-node:12 yarn --version
1.15.2

$ docker run --rm mhart/alpine-node:8 node --version
v8.16.0

$ docker run --rm mhart/alpine-node:6 node --version
v6.17.1

$ docker run --rm mhart/alpine-node:base-10 node --version
v10.15.3

$ docker run --rm mhart/alpine-node:base-8 node --version
v8.16.0

$ docker run --rm mhart/alpine-node:base-0.10 node --version
v0.10.48
```

Example Dockerfile for your own Node.js project
-----------------------------------------------

Assuming you're doing your `npm install` or `yarn install` from your
`Dockerfile`, you'll probably want to add `node_modules` to your
`.dockerignore` file first, so that it doesn't get sent to the docker daemon.

Here's a typical example using a "full install" image:

```Dockerfile
FROM mhart/alpine-node:12

WORKDIR /app
COPY . .

# If you have native dependencies, you'll need extra tools
# RUN apk add --no-cache make gcc g++ python

RUN npm install --prod

EXPOSE 3000
CMD ["node", "index.js"]
```

However, for an even smaller build: from Docker version 17.05 onwards, you can
do multi-stage builds – so you can `npm ci` or `yarn install` using the
full install image, but then create your app using a raw alpine image –
this can reduce the size of your final image by ~35MB or so.

```Dockerfile
FROM mhart/alpine-node:12
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --prod

# Only copy over the node pieces we need from the above image
FROM alpine:3.9
COPY --from=0 /usr/bin/node /usr/bin/
COPY --from=0 /usr/lib/libgcc* /usr/lib/libstdc* /usr/lib/
WORKDIR /app
COPY --from=0 /app .
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
```

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
