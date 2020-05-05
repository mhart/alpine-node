#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:14.2.0 \
  -t mhart/alpine-node:14.2 \
  -t mhart/alpine-node:14 \
  -t mhart/alpine-node:latest \
  -f extract.dockerfile \
  .
