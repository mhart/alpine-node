#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:latest \
  -t mhart/alpine-node:13.5.0 \
  -t mhart/alpine-node:13.5 \
  -t mhart/alpine-node:13 \
  .
