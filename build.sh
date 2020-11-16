#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:15.2.1 \
  -t mhart/alpine-node:15.2 \
  -t mhart/alpine-node:15 \
  -t mhart/alpine-node:latest \
  -f build.dockerfile \
  .
