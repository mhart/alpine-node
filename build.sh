#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:14.8.0 \
  -t mhart/alpine-node:14.8 \
  -t mhart/alpine-node:14 \
  -t mhart/alpine-node:latest \
  -f build.dockerfile \
  .
