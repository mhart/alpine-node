#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:16.0.0 \
  -t mhart/alpine-node:16.0 \
  -t mhart/alpine-node:16 \
  -t mhart/alpine-node:latest \
  -f build.dockerfile \
  .
