#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.22.1 \
  -t mhart/alpine-node:12.22 \
  -t mhart/alpine-node:12 \
  -f build.dockerfile \
  .
