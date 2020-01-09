#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:10.18.1 \
  -t mhart/alpine-node:10.18 \
  -t mhart/alpine-node:10 \
  -f build.dockerfile \
  .
