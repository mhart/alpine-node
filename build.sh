#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.14.1 \
  -t mhart/alpine-node:12.14 \
  -t mhart/alpine-node:12 \
  -f extract.dockerfile \
  .
