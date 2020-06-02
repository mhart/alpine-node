#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:10.21.0 \
  -t mhart/alpine-node:10.21 \
  -t mhart/alpine-node:10 \
  -f tools.dockerfile .
