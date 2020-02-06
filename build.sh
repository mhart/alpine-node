#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.15.0 \
  -t mhart/alpine-node:12.15 \
  -t mhart/alpine-node:12 \
  -f extract.dockerfile \
  .
