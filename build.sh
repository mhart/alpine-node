#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.20.0 \
  -t mhart/alpine-node:12.20 \
  -t mhart/alpine-node:12 \
  -f extract.dockerfile \
  .
