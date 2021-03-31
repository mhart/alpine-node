#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:15.13.0 \
  -t mhart/alpine-node:15.13 \
  -t mhart/alpine-node:15 \
  -t mhart/alpine-node:latest \
  -f build.dockerfile \
  .
