#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:15.9.0 \
  -t mhart/alpine-node:15.9 \
  -t mhart/alpine-node:15 \
  -t mhart/alpine-node:latest \
  -f extract.dockerfile \
  .
