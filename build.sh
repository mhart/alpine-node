#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.17.0 \
  -t mhart/alpine-node:12.17 \
  -t mhart/alpine-node:12 \
  -f build.dockerfile \
  .
