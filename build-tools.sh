#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.20.2 \
  -t mhart/alpine-node:12.20 \
  -t mhart/alpine-node:12 \
  -f tools.dockerfile .
