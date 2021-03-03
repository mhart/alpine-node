#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:15.11.0 \
  -t mhart/alpine-node:15.11 \
  -t mhart/alpine-node:15 \
  -t mhart/alpine-node:latest \
  -f extract.dockerfile \
  .
