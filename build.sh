#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.18.0 \
  -t mhart/alpine-node:12.18 \
  -t mhart/alpine-node:12 \
  -f build.dockerfile \
  .
