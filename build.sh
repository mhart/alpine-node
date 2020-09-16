#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:10.22.1 \
  -t mhart/alpine-node:10.22 \
  -t mhart/alpine-node:10 \
  -f build.dockerfile \
  .
