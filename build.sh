#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.19.1 \
  -t mhart/alpine-node:12.19 \
  -t mhart/alpine-node:12 \
  -f build.dockerfile \
  .
