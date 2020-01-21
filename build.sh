#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:13.7.0 \
  -t mhart/alpine-node:13.7 \
  -t mhart/alpine-node:13 \
  -t mhart/alpine-node:latest \
  -f extract.dockerfile \
  .
