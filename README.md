Minimal Node.js Docker Images
-----------------------------

Versions v9.5.0, v8.9.4, v6.12.3, v4.8.7, v0.12.18 and v0.10.48 –
built on [Alpine Linux](https://alpinelinux.org/).

All versions use the one [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node/) repository,
but each version aligns with the following tags (ie, `mhart/alpine-node:<tag>`). The sizes are for the
*unpacked* images as reported by Docker – compressed sizes are about 1/3 of these:

- Full install built with npm and yarn:
  - `latest`, `9`, `9.5`, `9.5.0` – 66.8 MB (npm 5.6.0, yarn 1.3.2)
  - `8`, `8.9`, `8.9.4` – 66.7 MB (npm 5.6.0, yarn 1.3.2)
- Full install build with npm:
  - `6`, `6.12`, `6.12.3` – 49.4 MB (npm 3.10.10)
  - `4`, `4.8`, `4.8.7` – 35.3 MB (npm 2.15.12)
  - `0.12`, `0.12.18` – 33.36 MB (npm 2.15.11)
  - `0.10`, `0.10.48` – 28.16 MB (npm 2.15.11)
- Base install with node built as a static binary with no npm or yarn:
  - `base`, `base-9`, `base-9.5`, `base-9.5.0` – 43.2 MB
  - `base-8`, `base-8.9`, `base-8.9.4` – 43.2 MB
  - `base-6`, `base-6.12`, `base-6.12.3` – 37.9 MB
  - `base-4`, `base-4.8`, `base-4.8.7` – 26.7 MB
  - `base-0.12`, `base-0.12.18` – 24.72 MB
  - `base-0.10`, `base-0.10.48` – 18.22 MB

Major io.js versions [are tagged too](https://hub.docker.com/r/mhart/alpine-node/tags/).

Examples
--------

```console
$ docker run mhart/alpine-node node --version
v9.5.0

$ docker run mhart/alpine-node npm --version
5.6.0

$ docker run mhart/alpine-node yarn --version
1.3.2

$ docker run mhart/alpine-node:8 node --version
v8.9.4

$ docker run mhart/alpine-node:6 node --version
v6.12.3

$ docker run mhart/alpine-node:base node --version
v9.5.0

$ docker run mhart/alpine-node:base-8 node --version
v8.9.4

$ docker run mhart/alpine-node:base-0.10 node --version
v0.10.48
```

Example Dockerfile for your own Node.js project
-----------------------------------------------

Assuming you're doing your `npm install` or `yarn install` from your
`Dockerfile`, you'll probably want to add `node_modules` to your
`.dockerignore` file first, so that it doesn't get sent to the docker daemon.

Here's a typical example using a "full install" image:

```Dockerfile
FROM mhart/alpine-node:8

WORKDIR /app
COPY . .

# If you have native dependencies, you'll need extra tools
# RUN apk add --no-cache make gcc g++ python

RUN npm install --production

EXPOSE 3000
CMD ["node", "index.js"]
```

However, for an even smaller build: from Docker version 17.05 onwards, you can
do multi-stage builds – so you can `npm install` or `yarn install` using the
full install image, but then create your app using one of the base images –
this can reduce the size of your final image by ~35MB or so.

```Dockerfile
# Do the npm install or yarn install in the full image
FROM mhart/alpine-node:8
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production

# And then copy over node_modules, etc from that stage to the smaller base image
FROM mhart/alpine-node:base-8
WORKDIR /app
COPY --from=0 /app .
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
```

It should be noted that the `base-` images are statically compiled, so may not
work if you have native npm module dependencies.

Another option, which *will* work with native modules and also has the advantage
of not needing to pull another container down from Docker, is just to copy the
node binary and libstdc++ libraries from the full image onto a straight alpine
image:

```Dockerfile
FROM mhart/alpine-node:8
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production

# Only copy over the node pieces we need from the above image
FROM alpine:3.6
COPY --from=0 /usr/bin/node /usr/bin/
COPY --from=0 /usr/lib/libgcc* /usr/lib/libstdc* /usr/lib/
WORKDIR /app
COPY --from=0 /app .
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
```

Another advantage of this approach is that the full images are typically
updated first, before the `base-` images, so you might get updates slightly
sooner. The main disadvantage is that it requires a slightly larger, slightly
messier Dockerfile.

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
