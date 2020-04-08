#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:10.20.0 \
  -t mhart/alpine-node:10.20 \
  -t mhart/alpine-node:10 \
  -f tools.dockerfile .
