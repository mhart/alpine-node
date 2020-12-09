#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:15.4.0 \
  -t mhart/alpine-node:15.4 \
  -t mhart/alpine-node:15 \
  -t mhart/alpine-node:latest \
  -f build.dockerfile \
  .
