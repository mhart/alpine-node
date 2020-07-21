#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:10.22.0 \
  -t mhart/alpine-node:10.22 \
  -t mhart/alpine-node:10 \
  -f build.dockerfile \
  .
