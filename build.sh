#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.16.1 \
  -t mhart/alpine-node:12.16 \
  -t mhart/alpine-node:12 \
  -f extract.dockerfile \
  .
