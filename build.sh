#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:14.13.1 \
  -t mhart/alpine-node:14.13 \
  -t mhart/alpine-node:14 \
  -t mhart/alpine-node:latest \
  -f build.dockerfile \
  .
