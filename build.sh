#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:13.9.0 \
  -t mhart/alpine-node:13.9 \
  -t mhart/alpine-node:13 \
  -t mhart/alpine-node:latest \
  -f build.dockerfile \
  .
