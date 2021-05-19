#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:16.2.0 \
  -t mhart/alpine-node:16.2 \
  -t mhart/alpine-node:16 \
  -t mhart/alpine-node:latest \
  -f extract.dockerfile \
  .
