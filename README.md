Minimal Node.js Docker Images
-----------------------------

Versions v11.5.0, v10.15.0, v8.14.1, v6.15.1, v4.9.1, v0.12.18 and v0.10.48 –
built on [Alpine Linux](https://alpinelinux.org/).

All versions use the one [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node/) repository,
but each version aligns with the following tags (ie, `mhart/alpine-node:<tag>`). The sizes are for the
*unpacked* images as reported by Docker – compressed sizes are about 1/3 of these:

- Full install built with npm and yarn:
  - `latest`, `11`, `11.5`, `11.5.0` – 69.8 MB (npm 6.5.0, yarn 1.12.3)
  - `10`, `10.15`, `10.15.0` – 69 MB (npm 6.5.0, yarn 1.12.3)
  - `8`, `8.14`, `8.14.1` – 64.5 MB (npm 6.5.0, yarn 1.12.3)
- Full install build with npm:
  - `6`, `6.15`, `6.15.1` – 49 MB (npm 3.10.10)
  - `4`, `4.9`, `4.9.1` – 35.2 MB (npm 2.15.12)
  - `0.12`, `0.12.18` – 32.4 MB (npm 2.15.12)
  - `0.10`, `0.10.48` – 27.8 MB (npm 2.15.12)
- Base install with node built as a static binary with no npm or yarn:
  - `base`, `base-11`, `base-11.5`, `base-11.5.0` – 47.5 MB
  - `base-10`, `base-10.15`, `base-10.15.0` – 46.9 MB
  - `base-8`, `base-8.14`, `base-8.14.1` – 43.1 MB
  - `base-6`, `base-6.15`, `base-6.15.1` – 39.2 MB
  - `base-4`, `base-4.9`, `base-4.9.1` – 26.6 MB
  - `base-0.12`, `base-0.12.18` – 24.1 MB
  - `base-0.10`, `base-0.10.48` – 18.2 MB

Major io.js versions [are tagged too](https://hub.docker.com/r/mhart/alpine-node/tags/).

Examples
--------

```console
$ docker run mhart/alpine-node:11 node --version
v11.5.0

$ docker run mhart/alpine-node:10 node --version
v10.15.0

$ docker run mhart/alpine-node:10 npm --version
6.5.0

$ docker run mhart/alpine-node:10 yarn --version
1.12.3

$ docker run mhart/alpine-node:8 node --version
v8.14.1

$ docker run mhart/alpine-node:6 node --version
v6.15.1

$ docker run mhart/alpine-node:base-10 node --version
v10.15.0

$ docker run mhart/alpine-node:base-8 node --version
v8.14.1

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
FROM mhart/alpine-node:10

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
full install image, but then create your app using one of the base images –
this can reduce the size of your final image by ~35MB or so.

```Dockerfile
# Do the npm install or yarn install in the full image
FROM mhart/alpine-node:10
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --prod

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
FROM mhart/alpine-node:10
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --prod

# Only copy over the node pieces we need from the above image
FROM alpine:3.7
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
