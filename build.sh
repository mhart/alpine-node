#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:14.9.0 \
  -t mhart/alpine-node:14.9 \
  -t mhart/alpine-node:14 \
  -t mhart/alpine-node:latest \
  -f build.dockerfile \
  .
