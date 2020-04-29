#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:13.14.0 \
  -t mhart/alpine-node:13.14 \
  -t mhart/alpine-node:13 \
  -f tools.dockerfile .
