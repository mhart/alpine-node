#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:14.15.0 \
  -t mhart/alpine-node:14.15 \
  -t mhart/alpine-node:14 \
  -f build.dockerfile \
  .
