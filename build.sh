#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:13.10.1 \
  -t mhart/alpine-node:13.10 \
  -t mhart/alpine-node:13 \
  -t mhart/alpine-node:latest \
  -f extract.dockerfile \
  .
