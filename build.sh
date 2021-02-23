#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.21.0 \
  -t mhart/alpine-node:12.21 \
  -t mhart/alpine-node:12 \
  -f extract.dockerfile \
  .
